require "./person.rb"

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom = 'None', name = "Unknown")
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end