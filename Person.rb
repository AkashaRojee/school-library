class Person
  def initialize(name, age)
    @id = Random.rand(0..5000)
    @name = name
    @age = age
  end
end