class Speech < ApplicationRecord
  belongs_to :speaker
  belongs_to :category

  has_many :contributions, dependent: :destroy

  before_create :format_content

  validates_presence_of :title, :date, :content, :category, :country
  validate :date_cannot_be_in_future

  include PgSearch
  multisearchable :against => [:title, :content, :category]

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
