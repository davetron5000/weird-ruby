class KnownNilLikeSentinel < NilLikeSentinel
  def self.when_known(&block)
    block.call(self)
  end
end

NoValue = Class.new(KnownNilLikeSentinel)
Empty   = Class.new(KnownNilLikeSentinel)
