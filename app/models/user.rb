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
    stats = {contributions: 0, comments: 0, contributions_votes: 0, comments_votes: 0}
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
  
  def total_votes
    self.total_stats[:comments_votes] + self.total_stats[:contributions_votes]
  end

  def level
    byebug
    current_stats = self.total_stats
    case (5 * current_stats[:contributions] + 2 * current_stats[:comments] + current_stats[:contributions_votes] + current_stats[:comments_votes])
    when 0..24 then return 1
    when 25..150 then return 2
    when 150..500 then return 3
    when 500..1000 then return 4
    else return 5
    end
  end
end
