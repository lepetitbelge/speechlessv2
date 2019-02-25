class Category < ApplicationRecord
  has_many :speeches

  validates :name, presence: true, uniqueness: true
end
