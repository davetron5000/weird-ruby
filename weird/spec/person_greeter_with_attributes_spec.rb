require 'spec_helper'
require 'weird/person'
require 'weird/nil_like_sentinel'
require 'weird/noattr/person'
require 'weird/noattr/present'
require 'weird/noattr/person_with_attributes'
require 'weird/noattr/person_greeter_attributes'

describe PersonGreeterAttributes do
  it "says hi" do
    person = Person.new(nil,nil)
    person.first_name = "Bob"
    PersonGreeterAttributes.new.greet(person).should == "Hi, Bob"
  end

  it "says hello Mr" do
    person = Person.new(nil,nil)
    person.last_name = "Jones"
    person.gender = Gender.new
    person.gender.salutation = "Mr"
    PersonGreeterAttributes.new.greet(person).should == "Hello Mr Jones"
  end

  it "says hello last_name" do
    person = Person.new(nil,nil)
    person.last_name = "Jones"
    person.instance_variable_get("@last_name").should == "Jones"
    PersonGreeterAttributes.new.greet(person).should == "Hello Jones"
  end

  it "says hello" do
    person = Person.new(nil,nil)
    PersonGreeterAttributes.new.greet(person).should == "Hello"
  end
end
