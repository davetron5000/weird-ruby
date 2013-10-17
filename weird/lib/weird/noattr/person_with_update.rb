class Person
  def update(&block)
    update = Update.new
    block.(update)

    update.each_attribute do |name,new_value|
      instance_variable_set("@#{name}",new_value)
    end
  end
end
