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

  def handle_choice(choice)
    case choice
    when 12 then exit
    else
      puts 'invalid input'
    end
  end

  def main
    loop do
      options

      choice = gets.chomp.to_i

      handle_choice(choice)
    end
  end
end

app = AppDisplay.new

app.main
