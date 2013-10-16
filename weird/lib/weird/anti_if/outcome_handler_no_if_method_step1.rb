class OutcomeNoIf < Outcome

private 

  def method_for_status(status)

                if { status == 200 }, :call_on_success
                if { status <  500 }, :call_on_decline



    else      :call_on_exception
  end
end
