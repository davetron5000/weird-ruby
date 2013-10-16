require 'spec_helper'
require 'weird/anti_if/logic'

describe Logic do
  it "should detect inconsistencies" do
    logic = Logic.new
    logic.on { |status|
      status == 200
    }.then_return(:on_success)

    logic.on { |status|
      status < 500
    }.then_return(:on_decline)

    expect {
      logic.evaluate!(200, or_else: :on_exception)
    }.to raise_error(Logic::NonExclusiveDisjunction)
  end

  it "should be OK when things are consistent" do
    logic = Logic.new
    logic.on { |status|
      status == 200
    }.then_return(:on_success)

    logic.on { |status|
      status < 500 && status != 200
    }.then_return(:on_decline)

    result = nil
    expect {
      result = logic.evaluate!(200, or_else: :on_exception)
    }.to_not raise_error
    result.should == :on_success

    logic.evaluate!(400, or_else: :on_exception).should == :on_decline
    logic.evaluate!(500, or_else: :on_exception).should == :on_exception
  end

  it "should be OK when we go nuts with blocks " do
    status_ok = ->(status) { status == 200 }
    status_declined = ->(status) { !status_ok.(status) && status < 500 }

    logic = Logic.new
    logic.on(&status_ok).then_return(:on_success)
    logic.on(&status_declined).then_return(:on_decline)

    result = nil
    expect {
      result = logic.evaluate!(200, or_else: :on_exception)
    }.to_not raise_error
    result.should == :on_success

    logic.evaluate!(400, or_else: :on_exception).should == :on_decline
    logic.evaluate!(500, or_else: :on_exception).should == :on_exception
  end
end
