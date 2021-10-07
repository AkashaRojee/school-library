class Person
  attr_accessor :name, :age
  attr_reader :id
  
  def initialize(name = "Unknown", age, parent_permission = true)
    @id = Random.rand(0..5000)
    @name = name
    @age = age
  end
end