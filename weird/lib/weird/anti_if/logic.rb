class Logic
  def initialize
    @expressions = []
  end

  def on(&block)
    ThenReturn.new(block,@expressions)
  end

  def evaluate!(input,or_else)
    results = @expressions.select { |predicate,_|
      predicate.(input)
    }
    {
      0 => ->() { or_else[:or_else] },
      1 => ->() { results[0][1] }
    }.fetch(results.size) {
      ->() { raise NonExclusiveDisjunction }
    }.()
  end

  class NonExclusiveDisjunction < Exception
  end

private

  class ThenReturn
    def initialize(block,expressions)
      @block = block
      @expressions = expressions
    end

    def then_return(value)
      @expressions << [ @block, value ]
    end
  end
end
