class Person

  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(name = "Unkown", age, parent_permission = true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def is_of_age?
    return true if @age >= 18
    false
  end

  private :of_age?
end
