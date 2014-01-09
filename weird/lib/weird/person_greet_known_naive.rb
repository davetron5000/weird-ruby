class Person
  def greet
    title.when_value {
      "Hello #{title} #{name}"
    }.or_else {
      if title == NoValue || title == Empty
        "Hello #{name}"
      else
        "Not sure how to greet you, #{name}"
      end
    }
  end
end
