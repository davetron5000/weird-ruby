class Outcome
  def validate_all_outcomes_handled!
    raise MissingOutcomeError, "on_success not handled" if @on_success.nil?
    raise MissingOutcomeError, "on_decline not handled" if @on_decline.nil?
    raise MissingOutcomeError, "on_expiration not handled" if @on_expiration.nil?
    raise MissingOutcomeError, "on_exception not handled" if @on_exception.nil?
  end

  class MissingOutcomeError < Exception
  end
end
