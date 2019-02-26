class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contributions
  has_many :comments
  has_many :votes

  validates :username, presence: true

  def total_stats
    stats = {contributions: 0, comments: 0, comments_votes: 0, contributions_votes: 0}
    stats[:contributions] = self.contributions.count
    self.contributions.each do |contribution|
      stats[:contributions_votes] += contribution.vote_sum
      stats[:comments] += contribution.comments.count
      contribution.comments.each do |comment|
        stats[:comments_votes] += comment.vote_sum
      end
    end
    return stats
  end
end
