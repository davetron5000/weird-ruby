require 'spec_helper'
require 'weird/basic_object'
require 'weird/nil_like_sentinel'
require 'weird/person'

describe Person do
  before(:each) do
    class << Person
      if methods.include?(:greet)
        undef_method :greet
      end
    end
  end
  describe "naive" do
    before do
      load "weird/person_greet_naive.rb"
    end
    describe "#greet" do
      it "should greet with a title" do
        p = Person.new("Bob",24,"Mr")

        p.greet.should == "Hello Mr Bob"
      end

      it "should greet without a title" do
        p = Person.new("Bob",24)

        p.greet.should == "Hello Bob"
      end

      it "should greet incorrectly" do
        p = Person.new("Bob",24,NoValue)
        p.greet.should == "Hello NoValue Bob"
      end
    end
  end

  describe "better" do
    before do
      load "weird/person_greet_better.rb"
    end
    describe "#greet" do
      it "should greet with a title" do
        p = Person.new("Bob",24,"Mr")

        p.greet.should == "Hello Mr Bob"
      end

      it "should greet without a title" do
        p = Person.new("Bob",24)

        p.greet.should == "Hello Bob"
      end

      it "should greet correctly" do
        p = Person.new("Bob",24,NoValue)
        p.greet.should == "Hello Bob"
      end
    end
  end

  describe "known_naive" do
    before do
      load "weird/person_greet_known_naive.rb"
    end
    describe "#greet" do
      [Unassigned,Unassigned].each do |nil_like|
        it "should greet when #{nil_like}" do
          p = Person.new("Bob",24,nil_like)
          p.greet.should == "Not sure how to greet you, Bob"
        end
      end
    end
  end

  describe "known_better" do
    before do
      load "weird/person_greet_known_better.rb"
    end
    describe "#greet" do
      [Unassigned,Unassigned].each do |nil_like|
        it "should greet when #{nil_like}" do
          p = Person.new("Bob",24,nil_like)
          p.greet.should == "Not sure how to greet you, Bob"
        end
      end
    end
  end
end
