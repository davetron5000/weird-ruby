class Person
  def greet
    if title == Unknown
      "Hello #{name}"
    else
      "Hello #{title} #{name}"
    end
  end
end
