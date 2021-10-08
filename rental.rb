class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def add_book(book)
    @book = book
    book.rentals.push(self)
  end

  def add_person(person)
    @person = person
    person.rentals.push(self)
  end
end
