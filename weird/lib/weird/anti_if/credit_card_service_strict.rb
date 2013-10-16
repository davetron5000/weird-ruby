class CreditCardServiceStrict
  def self.charge!(customer,amount,&block)
    outcome = Outcome.new
    block.call(outcome)
    outcome.validate_all_outcomes_handled!

    # ...
    
  end
end

