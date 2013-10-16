class Person
  def greet
    title.when_value {
      "Hello #{title} #{name}"
    }.or_else {
      if title == Unassigned || title == Unknown
        "Not sure how to greet you, #{name}"
      else
        "Hello #{name}"
      end
    }
  end
end
