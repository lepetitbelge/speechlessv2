class Contribution < ApplicationRecord
  belongs_to :speech
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  # question: If we add :user to line 9. What happens when we delete a user (it has no dependent destroy)?
  validates_presence_of :content, :start_position, :end_position, :speech
  validates :content, length: { maximum: 1000, too_long: "can't have more than %{count} characters" }

  def vote_sum
    value_sum = 0
    Vote.where(votable_type: "Contribution", votable_id: self.id).each do |vote|
      value_sum += vote.value
    end
    return value_sum
  end

  def current_user_vote
    current_vote = Vote.where(votable_type: "Contribution", votable_id: self.id, user_id: current_user.id).first
    if current_vote
      return current_vote.value
    else
      return 0
    end
  end
end
