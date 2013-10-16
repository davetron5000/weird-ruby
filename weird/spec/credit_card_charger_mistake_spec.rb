require 'spec_helper'
require 'weird/anti_if/credit_card_service_strict'
require 'weird/anti_if/outcome_strict'
require 'weird/anti_if/credit_card_charger_mistake'

describe CreditCardChargerMistake do
  describe "charge_customer" do
    it "barfs" do
      expect {
        CreditCardChargerMistake.new.charge_customer(nil,nil)
      }.to raise_error(/on_expiration not handled/)
    end
  end
end
