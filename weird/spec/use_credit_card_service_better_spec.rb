require 'spec_helper'
require 'weird/anti_if/credit_card_service_better'
require 'weird/anti_if/outcome'
require 'weird/anti_if/use_credit_card_service_better'

describe CreditCardChargerWeird do
  describe "charge_customer" do
    it "returns nil on success" do
      CreditCardServiceWeird.next_return = CreditCardService::Result.new(true,nil)
      result = CreditCardChargerWeird.new.charge_customer(nil,nil)
      result.should == nil
    end

    it "returns exception message on barf" do
      CreditCardServiceWeird.next_return = StandardError.new("WTF")
      result = CreditCardChargerWeird.new.charge_customer(nil,nil)
      result.should == "WTF"
    end

    it "returns expiration notice" do
      CreditCardServiceWeird.next_return = CreditCardService::Result.new(false,CreditCardService::EXPIRED)
      result = CreditCardChargerWeird.new.charge_customer(nil,nil)
      result.should == "Your card has expired-update and try again"
    end

    it "returns decline" do
      CreditCardServiceWeird.next_return = CreditCardService::Result.new(false,"blah")
      result = CreditCardChargerWeird.new.charge_customer(nil,nil)
      result.should == "Sorry, your card was declined"
    end
  end
end
