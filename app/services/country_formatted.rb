class CountryFormatted
  def initialize(country)
    @country = country
  end

  def perform
    change_to_full_country_name
  end

  private

  def change_to_full_country_name
    iso_country = ISO3166::Country[@country]
    iso_country.translations[I18n.locale.to_s] || iso_country.name
  end
end
