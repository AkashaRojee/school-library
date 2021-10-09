require_relative './book'

LIST_ALL_BOOKS_CODE = '1'.freeze
LIST_ALL_PEOPLE_CODE = '2'.freeze

def print_options
  puts "#{LIST_ALL_BOOKS_CODE}) List all books"
  puts "#{LIST_ALL_PEOPLE_CODE}) List all people"
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