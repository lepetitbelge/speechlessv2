class Speech < ApplicationRecord
  belongs_to :speaker
  belongs_to :category

  has_many :contributions, dependent: :destroy

  validates_presence_of :title, :date, :content, :category
  validate :city_or_country
  validate :date_cannot_be_in_future

  private

  def city_or_country
    errors.add(:city, "or country must be present") unless city.present? || country.present?
  end

  def date_cannot_be_in_future
    errors.add(:date, "can't be in the future") if Date.today < date
  end
end
