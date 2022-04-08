class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end
end