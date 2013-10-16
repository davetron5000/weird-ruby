class NilLikeSentinel
  def self.when_value(*)
    self
  end

  def self.or_else(&block)
    block.call
  end
end

Unassigned = Class.new(NilLikeSentinel)
Unknown    = Class.new(NilLikeSentinel)
NoValue    = Class.new(NilLikeSentinel)
Empty      = Class.new(NilLikeSentinel)
