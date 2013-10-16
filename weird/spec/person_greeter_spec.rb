require 'spec_helper'
require 'weird/noattr/person'
require 'weird/noattr/present'
require 'weird/noattr/person_greeter'

describe PersonGreeter do
  it "says hi" do
    person = Person.new(nil,nil)
    person.first_name = "Bob"
    PersonGreeter.new.greet(person).should == "Hi, Bob"
  end

  it "says hello Mr" do
    person = Person.new(nil,nil)
    person.last_name = "Jones"
    person.gender = Gender.new
    person.gender.salutation = "Mr"
    PersonGreeter.new.greet(person).should == "Hello Mr Jones"
  end

  it "says hello last_name" do
    person = Person.new(nil,nil)
    person.last_name = "Jones"
    PersonGreeter.new.greet(person).should == "Hello Jones"
  end

  it "says hello" do
    person = Person.new(nil,nil)
    PersonGreeter.new.greet(person).should == "Hello"
  end
end
