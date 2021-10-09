require_relative './book'

LIST_ALL_BOOKS_CODE = '1'.freeze

def print_options
  puts "#{LIST_ALL_BOOKS_CODE}) List all books"
end

def main
  books = []
  loop do
    print_options
    case gets.chomp
    when LIST_ALL_BOOKS_CODE
      books.each { |book| puts book.details }
    end
  end
end

main