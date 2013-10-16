class AddressNormalizer
  def normalize_address(person)
    person.with_attributes { |city, zip_code|
      person.city     = city.strip.downcase
      person.zip_code = zipcode.strip.downcase
    }
  end
end
