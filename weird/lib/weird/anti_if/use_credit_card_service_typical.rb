class CreditCardCharger
  def charge_customer(customer,amount)
    result = CreditCardService.charge!(customer,amount)
    unless result.success?
      if result.error_code == CreditCardService::EXPIRED
        "Your card has expired-update and try again"
      else
        "Sorry, your card was declined"
      end
    end
  rescue => ex
    ex.message
  end
end
