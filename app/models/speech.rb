class Speech < ApplicationRecord
  belongs_to :speaker
  belongs_to :category

  has_many :contributions, dependent: :nullify

  before_create :format_content, :format_country
  before_update :format_country

  validates_presence_of :title, :date, :content, :category, :country, :vote_sum
  validates :title, length: { maximum: 44, too_long: "can't have more than %{count} characters" }
  validate :date_cannot_be_in_future

  include PgSearch
  pg_search_scope :search, against: [:title, :content], associated_against: {
    speaker: [:first_name, :last_name]
  }, using: [:tsearch, :trigram]

  def total_stats
    stats = { contributions: 0, comments: 0 }
    stats[:contributions] += self.contributions.count
    self.contributions.each do |contribution|
      stats[:comments] += contribution.comments.count
    end
    return stats
  end

  def location
    loc = self.city + ", " || ""
    loc += self.country
  end

  private

  def format_content
    self.content = SpeechContentToHtml.new(content).perform
  end

  def format_country
    self.country
  end

  def date_cannot_be_in_future
    if date
      errors.add(:date, "can't be in the future") if Date.today < date
    end
  end
end
