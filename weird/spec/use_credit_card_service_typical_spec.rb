require 'spec_helper'
require 'weird/anti_if/credit_card_service_typical'
require 'weird/anti_if/use_credit_card_service_typical'

describe CreditCardCharger do
  describe "charge_customer" do
    it "returns nil on success" do
      CreditCardService.next_return = CreditCardService::Result.new(true,nil)
      result = CreditCardCharger.new.charge_customer(nil,nil)
      result.should == nil
    end

    it "returns exception message on barf" do
      CreditCardService.next_return = StandardError.new("WTF")
      result = CreditCardCharger.new.charge_customer(nil,nil)
      result.should == "WTF"
    end

    it "returns expiration notice" do
      CreditCardService.next_return = CreditCardService::Result.new(false,CreditCardService::EXPIRED)
      result = CreditCardCharger.new.charge_customer(nil,nil)
      result.should == "Your card has expired-update and try again"
    end

    it "returns decline" do
      CreditCardService.next_return = CreditCardService::Result.new(false,"blah")
      result = CreditCardCharger.new.charge_customer(nil,nil)
      result.should == "Sorry, your card was declined"
    end
  end
end
