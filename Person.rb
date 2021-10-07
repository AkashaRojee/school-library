class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name = "Unknown", age, parent_permission = true)
    @id = Random.rand(0..10000)
    @name = name
    @age = age
  end

  private
  def is_of_age?
    age >= 18
  end
end