require_relative '../classes/game'
require_relative '../classes/author'
require 'json'

AUTHORS_FILE = 'db/json/authors.json'
GAMES_FILE = 'db/json/games.json'

def create_json_file_if_not_exists(file_path)
  unless File.exist?(file_path)
    File.open(file_path, 'w') { |file| file.puts '[]' }
    puts "Created #{file_path}."
  end
end

def initialize_json_files
  create_json_file_if_not_exists(AUTHORS_FILE)
  create_json_file_if_not_exists(GAMES_FILE)
end

def list_games
  games_data = JSON.parse(File.read(GAMES_FILE))
  puts "\nList of Games:"
  games_data.each { |game_data| puts "#{game_data['id']}. #{game_data['label'] || 'Untitled'}" }
end


def list_authors
  authors_data = JSON.parse(File.read(AUTHORS_FILE))
  puts "\nList of Authors:"
  authors_data.each { |author_data| puts author_data['name'] }
end

def add_game
  puts "\nEnter Game Details:"
  print "Publish Date (YYYY-MM-DD): "
  publish_date = gets.chomp
  print "Last Played Date (YYYY-MM-DD): "
  last_played_at = gets.chomp

  game = {
    'publish_date' => publish_date,
    'last_played_at' => last_played_at,
    'label' => nil,
    'archived' => true,
    'id' => Random.rand(1..1000)
  }

  print "Label (optional): "
  game['label'] = gets.chomp

  games_data = JSON.parse(File.read(GAMES_FILE))
  games_data << game
  File.open(GAMES_FILE, 'w') { |file| file.puts JSON.pretty_generate(games_data) }

  puts "Game added successfully!"
end

initialize_json_files
