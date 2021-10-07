require './person'

class Teacher < Person

  def initialize(name = "Unknown", age, specialization)
    super(name, age)
    @specialization = specialization
  end