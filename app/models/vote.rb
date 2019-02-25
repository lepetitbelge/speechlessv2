class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true

  validates_presence_of :votable, :value
  validates :value, inclusion: { in: [-1, 0, 1], message: "must be -1, 0 or 1" }
  validates :user, uniqueness: { scope: %i[votable_id votable_type] }
end
