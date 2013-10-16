class BasicObject
  def when_value(&block)
    block.call(self)
  end
  def or_else(*)
    self
  end
end
