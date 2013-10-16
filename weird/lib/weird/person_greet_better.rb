class Person
  def greet
    title.when_value {
      "Hello #{title} #{name}"
    }.or_else {
      "Hello #{name}"
    }
  end
end
