require "./person.rb"

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, name = "Unknown", age, parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end
end