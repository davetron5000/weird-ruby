class Person
  def greet
    title.when_value {
      "Hello #{title} #{name}"
    }.when_known {
      "Hello #{name}"
    }.or_else {
      "Not sure how to greet you, #{name}"
    }
  end
end
