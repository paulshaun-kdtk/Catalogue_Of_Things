require_relative './book'

def add_book(books)
  puts 'enter publish date'
  publish_date = gets.chomp

  puts 'Enter publisher'
  publisher = gets.chomp

  puts 'Enter cover state'
  cover_state = gets.chomp

  book = Book.new(publish_date, publisher, cover_state)

  books << book

  book
end
