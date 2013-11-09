class OutcomeNoIf < Outcome
  def handle(result)
    status = result.status

    method_name = what_to_call(status)

    self.send(method_name)
  end
end
