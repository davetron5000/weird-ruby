require 'spec_helper'
require 'weird/noattr/normalize_address_updater'
require 'weird/person'
require 'weird/nil_like_sentinel'
require 'weird/noattr/person'
require 'weird/noattr/present'
require 'weird/noattr/person_with_attributes'
require 'weird/noattr/person_with_city_and_zip'
require 'weird/noattr/person_with_update'
require 'weird/noattr/person_greeter_attributes'
require 'weird/noattr/update'

describe AddressNormalizer do
  describe "normalize_address" do
    it "does nothing if there is no city" do
      person = Person.new(nil,nil)
      person.zip_code = "BLAH"
      AddressNormalizer.new.normalize_address(person)
      person.zip_code.should == "BLAH"
      person.city.should == nil
    end

    it "does nothing if there is no zip" do
      person = Person.new(nil,nil)
      person.city = "BLAH"
      AddressNormalizer.new.normalize_address(person)
      person.city.should == "BLAH"
      person.zip_code.should == nil
    end

    it "normalize if both are there" do
      person = Person.new(nil,nil)
      person.city = "  BLAH   "
      person.zip_code = "  123 FOUR   "
      AddressNormalizer.new.normalize_address(person)
      person.city.should == "blah"
      person.zip_code.should == "123 four"
    end
  end
end
