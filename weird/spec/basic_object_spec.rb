require 'spec_helper'
require 'weird/basic_object'
require 'weird/known_basic_object'

describe BasicObject do
  it 'should call the block for values' do
    called = false
    result = "foo".when_value {
      called = true
      "bar"
    }.or_else {
      fail "should not have been called"
    }

    called.should == true
    result.should == 'bar'
  end

  it 'should call the block for known' do
    called = false
    result = "foo".when_known {
      called = true
      "bar"
    }.or_else {
      fail "should not have been called"
    }

    called.should == true
    result.should == 'bar'
  end
end
