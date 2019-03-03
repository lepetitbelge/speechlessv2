class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :contribution

  has_many :votes, as: :votable, dependent: :nullify

  delegate :speech, to: :contribution

  validates_presence_of :content, :contribution
  validates :content, length: { maximum: 300, too_long: "can't have more than %{count} characters" }

  def vote_sum
    self.votes.sum(:value)
  end

  def user_vote(user)
    current_vote = Vote.where(votable_type: "Comment", votable_id: self.id, user_id: user.id).first
    if current_vote
      return current_vote.value
    else
      return 0
    end
  end
end
