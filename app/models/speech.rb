class Speech < ApplicationRecord
  belongs_to :speaker

  has_many :contributions, dependent: :destroy
end
