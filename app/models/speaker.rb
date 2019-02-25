class Speaker < ApplicationRecord
  has_many :speeches

  validate :first_or_last_name

  def full_name
    if self.first_name.nil?
      "#{self.last_name}"
    elsif self.last_name.nil?
      "#{self.first_name}"
    else
      "#{self.first_name} #{self.last_name}"
    end
  end

  private

  def first_or_last_name
    errors.add(:first_name, "or last name must be present") unless first_name.present? || last_name.present?
  end
end
