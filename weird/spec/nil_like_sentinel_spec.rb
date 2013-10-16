require 'spec_helper'
require 'weird/basic_object'
require 'weird/known_basic_object'
require 'weird/nil_like_sentinel'
require 'weird/known_nil_like_sentinel'

describe NilLikeSentinel do
  [Unassigned, Unknown, NoValue, Empty].each do |klass|
    context "for #{klass}" do
      subject { klass }
      it 'should call the block for or else' do
        called = false
        result = subject.when_value {
          fail "should not have been called"
        }.or_else {
          called = true
          'bar'
        }

        called.should == true
        result.should == 'bar'
      end
    end
  end
  [NoValue, Empty].each do |klass|
    context "for #{klass}" do
      subject { klass }
      it 'should call the block for or else' do
        called = false
        result = subject.when_known {
          called = true
          'bar'
        }.or_else {
          fail "should not have been called"
        }

        called.should == true
        result.should == 'bar'
      end
    end
  end
  [Unassigned, Unknown].each do |klass|
    context "for #{klass}" do
      subject { klass }
      it 'should call the block for or else' do
        called = false
        result = subject.when_known {
          fail "should not have been called"
        }.or_else {
          called = true
          'bar'
        }

        called.should == true
        result.should == 'bar'
      end
    end
  end
end
