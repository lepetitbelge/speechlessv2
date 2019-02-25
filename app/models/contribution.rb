class Contribution < ApplicationRecord
  belongs_to :speech
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  validates_presence_of :content, :start_position, :end_position
  validates :content, length: { maximum: 300, too_long: "can't have more than %{count} characters" }
end
