require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :parent_permission, :rentals

  def initialize(age, name = 'Unkown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    return true if @age >= 18

    false
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    rental = Rental.new(date, self, book)
    @rentals << rental unless @rentals.includes?(rental)
  end

  private :of_age?
  public :can_use_services?, :correct_name, :add_rental
end
