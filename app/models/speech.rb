class Speech < ApplicationRecord
  belongs_to :speaker
  belongs_to :category

  has_many :contributions, dependent: :nullify

  before_create :format_content

  validates_presence_of :title, :date, :content, :category, :country
  validates :title, length: { maximum: 44, too_long: "can't have more than %{count} characters" }
  validate :date_cannot_be_in_future

  include PgSearch
  multisearchable :against => [:title, :content, :category]

  def total_stats
    stats = { contributions: 0, comments: 0, comments_votes: 0, contributions_votes: 0 }
    stats[:contributions] += self.contributions.count
    self.contributions.each do |contribution|
      stats[:contributions_votes] += contribution.vote_sum
      stats[:comments] += contribution.comments.count
      contribution.comments.each do |comment|
        stats[:comments_votes] += comment.vote_sum
      end
    end
    return stats
  end

  def total_votes
    self.total_stats[:comments_votes] + self.total_stats[:contributions_votes]
  end

  private

  def format_content
    self.content = SpeechContentToHtml.new(content).perform
  end

  def date_cannot_be_in_future
    if date
      errors.add(:date, "can't be in the future") if Date.today < date
    end
  end
end
