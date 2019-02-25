class Contribution < ApplicationRecord
  belongs_to :speech
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy
end
