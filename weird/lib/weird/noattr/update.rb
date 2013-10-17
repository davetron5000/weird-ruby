class Update
  def initialize
    @attributes = {}
  end

  def each_attribute(&block)
    @attributes.each(&block)
  end

  def method_missing(sym,*args,&block)
    if args.empty?
      AttributeUpdater.new(sym,@attributes)
    else
      super
    end
  end

  class AttributeUpdater
    def initialize(name,attributes)
      @name = name
      @attributes = attributes
    end

    def to(new_value)
      @attributes[@name] = new_value
    end
  end
end
