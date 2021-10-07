class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def book=(book)
    @book = book
    book.rentals.push(self)
  end

  def person=(person)
    @person = person
    person.rentals.push(self)
  end
end
