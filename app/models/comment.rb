class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :contribution

  has_many :votes, as: :votable, dependent: :destroy

  validates_presence_of :content, :contribution
  validates :content, length: { maximum: 300, too_long: "can't have more than %{count} characters" }
end
