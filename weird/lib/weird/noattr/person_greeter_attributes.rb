class PersonGreeterAttributes
  def greet(person)
    person.with_attributes { |first_name|
      "Hi, #{first_name}"
    }.else_with_attributes { |gender_salutation,last_name|
      "Hello #{gender_salutation} #{last_name}"
    }.else_with_attributes { |last_name|
      "Hello #{last_name}"
    }.or_else {
      "Hello"
    }
  end
end
