require 'spec_helper'
require 'weird/anti_if/credit_card_service_typical'

describe CreditCardService do
  describe "fakey" do
    it "can be faked out" do
      CreditCardService.next_return = CreditCardService::Result.new(false,"blah")
      result = CreditCardService.charge!(nil,nil)
      result.success?.should == false
      result.error_code.should == "blah"
    end
  end
end
