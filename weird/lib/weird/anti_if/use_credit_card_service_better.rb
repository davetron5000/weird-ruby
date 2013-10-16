class CreditCardChargerWeird
  def charge_customer(customer,amount)
    CreditCardServiceWeird.charge!(customer,amount) do |outcome|
      outcome.on_success {
        # ok!
      }.on_decline {
        "Sorry, your card was declined"
      }.on_expiration {
        "Your card has expired-update and try again"
      }.on_exception { |ex|
        ex.message
      }
    end
  end
end
