class Contribution < ApplicationRecord
  belongs_to :speech
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  # question: If we add :user to line 9. What happens when we delete a user (it has no dependent destroy)?
  validates_presence_of :content, :start_position, :end_position, :speech
  validates :content, length: { maximum: 1000, too_long: "can't have more than %{count} characters" }
end
