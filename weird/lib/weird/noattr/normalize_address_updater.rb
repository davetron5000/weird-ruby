class AddressNormalizer
  def normalize_address(person)
    person.with_attributes { |city, zip_code|
      person.update do |update|
        update.city.to     city.strip.downcase
        update.zip_code.to zipcode.strip.downcase
      end
    }
  end
end
