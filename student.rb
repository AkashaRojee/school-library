require_relative './person'
# rubocop:disable Style/OptionalBooleanParameter

class Student < Person
  def initialize(age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
# rubocop:enable Style/OptionalBooleanParameter
