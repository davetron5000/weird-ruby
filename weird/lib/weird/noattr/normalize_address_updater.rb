class AddressNormalizer
  def normalize_address(person)
    person.with_attributes { |city, zip_code|
      person.update_attributes do |update|
        update.city.to     city.strip.downcase
        update.zip_code.to zip_code.strip.downcase
      end
    }
  end
end
