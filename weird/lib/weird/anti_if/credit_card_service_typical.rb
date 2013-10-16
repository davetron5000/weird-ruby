class CreditCardService
  def self.charge!(customer,amount)
    if @result.kind_of?(Exception)
      raise @result
    else
      @result
    end
  end

  def self.next_return=(result)
    @result = result
  end

  EXPIRED = 1

  class Result
    attr_reader :error_code
    def initialize(success,error_code)
      @success = success
      @error_code = error_code
    end

    def success?
      @success
    end
  end
end

