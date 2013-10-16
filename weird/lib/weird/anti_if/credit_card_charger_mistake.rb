class CreditCardChargerMistake
  def charge_customer(customer,amount)
    CreditCardServiceStrict.charge!(customer,amount) do |outcome|
      outcome.on_success {
        # ok!
      }.on_decline {
        "Sorry, your card was declined"
      }.on_exception { |ex|
        ex.message
      }
    end
  end
end
