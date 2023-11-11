require_relative 'app'
require_relative 'apps/game_collection'
require_relative 'apps/music_collection'

def options
  puts 'Options:'
  puts '1. List all books'
  puts '2. List all music albums'
  puts '3. List all games'
  puts '4. List all genres'
  puts '5. List all labels'
  puts '6. List all authors'
  puts '7. Add a book'
  puts '8. Add a music album'
  puts '9. Add a genre'
  puts '10. Add a game'
  puts '11. Close app'
end

def handle_choice(choice, labels, books)
  case choice
  when 1 then list_all_books
  when 2 then list_music_albums
  when 3 then list_games
  when 4 then list_genres
  when 5 then list_all_labels
  when 6 then list_authors
  when 7 then add_book(labels, books)
  when 8 then add_music_album
  when 9 then add_genre
  when 10 then add_game
  when 11 then exit
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


main
