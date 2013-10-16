class Person
  attr_accessor :name, :birthdate, :title
  def initialize(name, birthdate, title=Unknown)
    @name      = name
    @birthdate = birthdate
    @title     = title
  end
end
