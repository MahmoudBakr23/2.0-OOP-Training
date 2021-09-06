require './person.rb'
require './classroom.rb'

class Student < Person
  belongs_to :classroom

  def initialize(age, classroom, name = "Unknown", parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
