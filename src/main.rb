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

def load_data
  books = load_books
  labels = load_labels
  [books, labels]
end

def main_menu_choice
  options
  gets.chomp.to_i
end

def handle_main_menu_choice(choice, labels, books)
  menu_actions = {
    1 => method(:list_all_books),
    2 => method(:list_music_albums),
    3 => method(:list_games),
    4 => method(:list_genres),
    5 => method(:list_all_labels),
    6 => method(:list_authors),
    7 => method(:add_book),
    8 => method(:add_music_album),
    9 => method(:add_genre),
    10 => method(:add_game),
    11 => method(:exit),
    :default => method(:handle_invalid_input)
  }
  menu_actions[choice].call(labels, books)
end

def main
  loop do
    books, labels = load_data
    choice = main_menu_choice
    handle_main_menu_choice(choice, labels, books)
  end
end

main
