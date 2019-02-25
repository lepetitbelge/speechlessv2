class Speech < ApplicationRecord
  belongs_to :speaker
  belongs_to :category

  has_many :contributions, dependent: :destroy

  validates_presence_of :title, :date, :content, :category
  validate :country_or_county
end
