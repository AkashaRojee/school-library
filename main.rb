require_relative './book'
require_relative './teacher'
require_relative './student'

LIST_ALL_BOOKS_CODE = '1'.freeze
LIST_ALL_PEOPLE_CODE = '2'.freeze
CREATE_A_PERSON_CODE = '3'.freeze
CREATE_A_BOOK_CODE = '4'.freeze

def print_options
  puts "#{LIST_ALL_BOOKS_CODE}) List all books"
  puts "#{LIST_ALL_PEOPLE_CODE}) List all people"
  puts "#{CREATE_A_PERSON_CODE}) Create a person"
  puts "#{CREATE_A_BOOK_CODE}) Create a book"
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
    end
  end
end

main