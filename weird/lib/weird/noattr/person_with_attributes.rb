class Person

  def with_attributes(&block)
    @gender_salutation = if @gender.present?
                           @gender.salutation
                         else
                           nil
                         end
    WithAttributes.with_attributes(self,&block)
  end

  class WithAttributes

    def self.with_attributes(object,&block)
      values = block.parameters.map { |param| param[1] }.map { |attribute|
        object.instance_variable_get("@#{attribute}")
      }
      if values.compact.size == values.size
        WithAttributes.new(object,block.call(*values))
      else
        WithAttributes.new(object)
      end
    end

    def initialize(object,value=nil)
      @object = object
      @value = value
    end

    def or_else(&block)
      if @value.present?
        @value
      else
        block.()
      end
    end

    def else_with_attributes(&block)
      if @value.present?
        self
      else
        WithAttributes.with_attributes(@object,&block)
      end
    end
  end
end
