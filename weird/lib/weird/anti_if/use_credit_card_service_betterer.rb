class CreditCardChargerWeirder
  def charge_customer(customer,amount)
    CreditCardServiceWeird.charge!(customer,amount) do |outcome|
      outcome.on_success(&NoOp)
        .on_decline {
          "Sorry, your card was declined"
        }.on_expiration {
          "Your card has expired-update and try again"
        }.on_exception(&MessageExtractor)
    end
  end
end

# Elsewhere in the codebase
NoOp = ->() {}
MessageExtractor = ->(ex) { ex.message }
