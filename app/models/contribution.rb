class Contribution < ApplicationRecord
  belongs_to :speech
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  # question: If we add :user to line 9. What happens when we delete a user (it has no dependent destroy)?
  validates_presence_of :content, :start_position, :end_position, :speech
  validates :content, length: { maximum: 1000, too_long: "can't have more than %{count} characters" }
  validate :start_and_end_position

  private

  def start_and_end_position
    if start_position && end_position
      if (0..content.length).include? start_position && (0..content.length).include? end_position
        errors.add(:start_position, "must be before end position") unless start_position < end_position
      else
        errors.add(:start_position, "and end position must be inside content")
      end
    end
  end
end
