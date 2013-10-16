class Outcome
  def on_success(&block)
    @on_success = block
    self
  end
  def on_decline(&block)
    @on_decline = block
    self
  end
  def on_expiration(&block)
    @on_expiration = block
    self
  end
  def on_exception(&block)
    @on_exception = block
    self
  end
  def call_on_success
    @on_success.()
  end
  def call_on_decline
    @on_decline.()
  end
  def call_on_expiration
    @on_expiration.()
  end
  def call_on_exception(ex=nil)
    @on_exception.(ex)
  end
end
