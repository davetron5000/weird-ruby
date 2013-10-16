class CreditCardServiceWeird
  def self.charge!(customer,amount,&block)
    outcome = Outcome.new
    begin
      block.call(outcome)
      if @result.kind_of?(Exception)
        raise @result
      elsif @result.success?
        outcome.call_on_success
      elsif @result.error_code == EXPIRED
        outcome.call_on_expiration
      else
        outcome.call_on_decline
      end
    rescue => ex
      outcome.call_on_exception(ex)
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

