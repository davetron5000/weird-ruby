class Outcome
  def handle(result)
    status = result.status
    method_name = if status < 500
                    :call_on_decline
                  elsif status == 200
                    :call_on_success
                  else
                    :call_on_exception
                  end
    self.send(method_name)
  end
end
