class PersonGreeter
  def greet(person)
    if person.first_name.present?
      "Hi, #{person.first_name}"
    elsif person.last_name.present?
      if person.gender.present? && person.gender.salutation.present?
        "Hello #{person.gender.salutation} #{person.last_name}"
      else
        "Hello #{person.last_name}"
      end
    else
      "Hello"
    end
  end
end
