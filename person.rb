class Person
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = "Unkown", parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def is_of_age?
    return true if @age >= 18
    false
  end

  def can_use_services?
    return true if is_of_age? || @parent_permission
    false
  end

  private :is_of_age?
  public :can_use_services?
end
