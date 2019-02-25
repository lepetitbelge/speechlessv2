class Speech < ApplicationRecord
  belongs_to :speaker
  belongs_to :category

  has_many :contributions, dependent: :destroy

  validates_presence_of :title, :date, :content, :category
  validate :city_or_country

  private

  def city_or_country
    errors.add(:city, "or country must be present") unless city.present? || country.present?
  end
end
