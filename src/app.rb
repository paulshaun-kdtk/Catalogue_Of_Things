require_relative 'book'
require_relative 'label'

def add_book(labels, books)
  puts "enter publish date ('YYYY-MM-DD')"
  publish_date = gets.chomp

  puts 'Enter publisher'
  publisher = gets.chomp

  puts 'Enter cover state'
  cover_state = gets.chomp

  puts 'Thats awesome! Now give the book a label'

  puts 'Title label:'
  title = gets.chomp

  puts 'Color label:'
  color = gets.chomp

  book = Book.new(publish_date, publisher, cover_state)
  label = Label.new(title, color)

  labeled = label.add_item(book)
  # puts "Label: #{label.title} - #{label.color}"
  # puts "Book: #{book.inspect}"

  labels << label
  books << book

  save_books(books)
  save_labels(labels)
  puts "Book added successfully"
  book
end

def list_all_books
  load_books.each do |book|
    puts "publish date: #{book.publish_date}, publisher: #{book.publisher}, cover state: #{book.cover_state}"
  end
end

def list_all_labels
  load_labels.each do |label|
    puts "Title: '#{label.title}' Color: '#{label.color}'"
  end
end
