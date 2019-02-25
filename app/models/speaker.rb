class Speaker < ApplicationRecord
  has_many :speeches

  validate :first_or_last_name

  private

  def first_or_last_name
    errors.add(:first_name, "or last name must be present") unless first_name.present? || last_name.present?
  end
end
