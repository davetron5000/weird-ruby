class OutcomeNoIf < Outcome
  def handle(result)
    status = result.status

    method_name = method_for_status(status)

    self.send(method_name)
  end
end
