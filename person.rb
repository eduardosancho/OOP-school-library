class Person

  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(name = "Unkown", age, parent_permission = true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
end
