class OutcomeNoIf < Outcome

private 

  def what_to_call(status)
    _,method = [
      [ ->(status) { status == 200 }, :call_on_success ],
      [ ->(status) { status <  500 }, :call_on_decline ],
    ].detect { |predicate,_|
      predicate.(status)
    }
    method || :call_on_exception
  end
end
