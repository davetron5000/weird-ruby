class OutcomeNoIf < Outcome

private 

  def method_for_status(status)
              [
     [ -> (status) { status == 200 }, :call_on_success ],
     [ -> (status) { status <  500 }, :call_on_decline ],
    ].detect { |predicate,_|
      predicate.(status)
    }
    else      :call_on_exception
  end
end