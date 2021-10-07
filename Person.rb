class Person
  def initialize(name = "Unknown", age, parent_permission = true)
    @id = Random.rand(0..5000)
    @name = name
    @age = age
  end
end