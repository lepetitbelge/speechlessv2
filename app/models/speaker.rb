class Speaker < ApplicationRecord
  has_many :speeches
  
  validate_presence_of :first_name
  validates :last_name
  validates :date_of_birth
  validates :date_of_death
end
