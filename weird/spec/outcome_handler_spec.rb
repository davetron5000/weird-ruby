require 'spec_helper'
require 'weird/anti_if/outcome'
require 'weird/anti_if/outcome_strict'
require 'weird/anti_if/outcome_handler'
require 'ostruct'

describe Outcome do
  describe "handle" do
    let(:outcome) {
      Outcome.new.tap { |outcome|
        outcome.on_success {
          fail
        }.on_decline {
          fail
        }.on_expiration {
          fail
        }.on_exception {
          fail
        }
      }
    }
    it "calls success for a 200" do
      called = false
      outcome.on_success {
        called = true
        "foo"
      }
      result = outcome.handle do
        OpenStruct.new(status: 200)
      end

      result.should == "foo"
      called.should == true
    end

    it "calls decline for a 404" do
      called = false
      outcome.on_decline {
        called = true
        "foo"
      }
      result = outcome.handle do
        OpenStruct.new(status: 404)
      end

      result.should == "foo"
      called.should == true
    end

    it "calls exception for a 500" do
      called = false
      outcome.on_exception { |ex|
        called = true
        "foo"
      }
      result = outcome.handle do
        OpenStruct.new(status: 500)
      end

      result.should == "foo"
      called.should == true
    end

  end
end
