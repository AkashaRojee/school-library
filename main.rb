require_relative './book'
require_relative './teacher'
require_relative './student'
require_relative './rental'

LIST_ALL_BOOKS_CODE = '1'.freeze
LIST_ALL_PEOPLE_CODE = '2'.freeze
CREATE_A_PERSON_CODE = '3'.freeze
CREATE_A_BOOK_CODE = '4'.freeze
CREATE_A_RENTAL_CODE = '5'.freeze
LIST_ALL_RENTALS_CODE = '6'.freeze

def print_options
  puts "#{LIST_ALL_BOOKS_CODE}) List all books"
  puts "#{LIST_ALL_PEOPLE_CODE}) List all people"
  puts "#{CREATE_A_PERSON_CODE}) Create a person"
  puts "#{CREATE_A_BOOK_CODE}) Create a book"
  puts "#{CREATE_A_RENTAL_CODE}) Create a rental"
  puts "#{LIST_ALL_RENTALS_CODE}) List all rentals for a given person id"
end

def create_book
  system 'clear'
  puts 'Enter the title of the book'
  title = gets.chomp
  puts 'Enter the author of the book'
  author = gets.chomp
  puts 'Book created successfully'
  Book.new(title, author)
end

def create_teacher
  system 'clear'
  puts 'Enter the name of the teacher'
  name = gets.chomp
  puts 'Enter the age of the teacher'
  age = gets.chomp
  puts 'Enter the specialization'
  spec = gets.chomp
  puts 'Teacher created successfully'
  Teacher.new(age, spec, name)
end

def create_student
  system 'clear'
  puts 'Enter the name of the student'
  name = gets.chomp
  puts 'Enter the age of the student'
  age = gets.chomp
  puts 'Has a parent permission [Y/N]'
  permission = gets.chomp
  Student.new(age, name, permission.upcase.match?('Y'))
end


def create_person
  loop do
    system 'clear'
    puts '1) To create teacher'
    puts '2) To create student'
    case gets.chomp
    when '1'
      return create_teacher
    when '2'
      return create_student
    else
      puts 'Wrong input, try again!'
    end
  end
end

def rental_book(books)
  loop do
    puts 'Select a Book from the following list by number '
    books.each_with_index do |book, i|
      puts "#{i}) #{book.details}"
    end

    book = gets.chomp.to_i
    case book
    when 0..books.size
      return books[book]
    else
      puts 'That book does not exist'
    end
  end
end

def renting_person(people)
  puts 'Select a person from the following list by number '
  people.each_with_index do |person, i|
    puts "#{i}) #{person.details}"
  end
  person = gets.chomp.to_i
  case person
  when 0..people.size
    people[person]
  end
end

def date
  puts 'Enter the date of the rental'
  gets.chomp
end

def id
  puts 'ID of person'
  gets.chomp.to_i
end

def create_rental(books, people)
  system 'clear'
  book = rental_book(books)
  person = renting_person(people)
  user_date = date
  puts 'Rental created successfully'
  Rental.new(user_date, book, person)
end

def list_rentals(rentals)
  system 'clear'
  person_id = id
  rentals.each do |rent|
    puts rent.details if rent.person.id.eql? person_id
  end
end

def main
  books = []
  people = []
  loop do
    print_options
    case gets.chomp
    when LIST_ALL_BOOKS_CODE
      books.each { |book| puts book.details }
    when LIST_ALL_PEOPLE_CODE
      people.each { |pep| puts pep.details }
    when CREATE_A_PERSON_CODE
      people.push(create_person)
    when CREATE_A_BOOK_CODE
      books.push(create_book)
    when CREATE_A_RENTAL_CODE
      rentals.push(create_rental(books, people))
    when LIST_ALL_RENTALS_CODE
      list_rentals(rentals)
    end
  end
end

main