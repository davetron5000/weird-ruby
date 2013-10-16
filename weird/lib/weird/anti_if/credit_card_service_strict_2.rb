class CreditCardServiceStrict
  def self.charge!(customer,amount,&block)
    outcome = Outcome.new
    block.call(outcome)
    outcome.validate_all_outcomes_handled!

    outcome.handle do
      rest_call(make_url(customer,amount))
    end

  private

    def rest_call(_)
      # ...
    end

    def make_url(customer,amount)
      # ...
    end
  end
end

