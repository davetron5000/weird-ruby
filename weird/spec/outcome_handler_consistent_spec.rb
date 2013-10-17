require 'spec_helper'
require 'weird/anti_if/outcome'
require 'weird/anti_if/outcome_strict'
require 'weird/anti_if/outcome_handler'
require 'weird/anti_if/outcome_handler_no_if'
require 'weird/anti_if/outcome_handler_no_if_method'
require 'ostruct'

describe OutcomeNoIf do
  describe "handle" do
    let(:outcome) {
      OutcomeNoIf.new.tap { |outcome|
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
      result = outcome.handle( OpenStruct.new(status: 200))

      result.should == "foo"
      called.should == true
    end

    it "calls decline for a 404" do
      called = false
      outcome.on_decline {
        called = true
        "foo"
      }
      result = outcome.handle( OpenStruct.new(status: 404) )

      result.should == "foo"
      called.should == true
    end

    it "calls exception for a 500" do
      called = false
      outcome.on_exception { |ex|
        called = true
        "foo"
      }
      result = outcome.handle( OpenStruct.new(status: 500) )

      result.should == "foo"
      called.should == true
    end

  end
end
