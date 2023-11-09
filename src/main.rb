require_relative 'app'

class AppDisplay
  def options
    puts 'Options:'
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all movies'
    puts '4. List all games'
    puts '5. List all genres'
    puts '6. List all labels'
    puts '7. List all authors'
    puts '8. List all sources'
    puts '9. Add a book'
    puts '10. Add a music album'
    puts '11. Add a movie'
    puts '12. Add a game'
  end

  def handle_choice(choice, labels, books)
    case choice
    when 1 then list_all_books
    when 6 then list_all_labels
    when 9 then add_book(labels, books)
    when 12 then exit
    else
      puts 'invalid input'
    end
  end

  def main
    loop do
      books = load_books
      labels = load_labels

      options

      choice = gets.chomp.to_i

      handle_choice(choice, labels, books)
    end
  end
end

app = AppDisplay.new

app.main
