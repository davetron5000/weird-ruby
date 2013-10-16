class Outcome
  def handle(&block)
    status = block.().status
    if status == 200
      call_on_success
    elsif status < 500
      call_on_decline
    else
      call_on_exception
    end
  end
end
