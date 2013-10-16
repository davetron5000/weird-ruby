class OutcomeNoIf < Outcome
  def handle(&block)
    status = block.().status
    method = method_for_status(status)
    self.send(method)
  end
end
