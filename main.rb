require_relative './book'

LIST_ALL_BOOKS_CODE = '1'.freeze
LIST_ALL_PEOPLE_CODE = '2'.freeze

def print_options
  puts "#{LIST_ALL_BOOKS_CODE}) List all books"
  puts "#{LIST_ALL_PEOPLE_CODE}) List all people"
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
  loop do
    print_options
    case gets.chomp
    when LIST_ALL_BOOKS_CODE
      books.each { |book| puts book.details }
    when LIST_ALL_PEOPLE_CODE
      people.each { |pep| puts pep.details }
    end
  end
end

main