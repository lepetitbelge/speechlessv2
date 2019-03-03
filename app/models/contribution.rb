class Contribution < ApplicationRecord
  belongs_to :speech
  belongs_to :user

  has_many :comments, dependent: :nullify
  has_many :votes, as: :votable, dependent: :nullify

  # question: If we add :user to line 9. What happens when we delete a user (it has no dependent destroy)?
  validates_presence_of :content, :speech
  validates :content, length: { maximum: 1000, too_long: "can't have more than %{count} characters" }

  def vote_sum
    self.votes.sum(:value)
  end

  def user_vote(user)
    current_vote = Vote.where(votable_type: "Contribution", votable_id: self.id, user_id: user.id).first
    if current_vote
      return current_vote.value
    else
      return 0
    end
  end
end
