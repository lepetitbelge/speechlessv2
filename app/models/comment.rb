class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :contribution

  has_many :votes, as: :votable, dependent: :destroy

  validates_presence_of :content, :contribution
end
