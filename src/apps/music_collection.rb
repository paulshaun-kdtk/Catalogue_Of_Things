require_relative '../classes/album'
require_relative '../classes/genre'
require 'json'

$genres = []
$music_albums = []

# data load

def load_genres
  file_path = 'db/json/genres.json'

  if File.exist?(file_path)
    file_content = File.read(file_path)
    genres_data = JSON.parse(file_content)

    $genres = genres_data.map { |data| Genre.new(data['name']) }

    puts 'Genres loaded successfully.'
  else
    puts 'Genres file not found. Returning an empty array.'
    $genres = []
  end
end

def load_albums
  if File.exist?('db/json/albums.json')
    albums_data = JSON.parse(File.read('db/json/albums.json'))
    albums_data.map do |album_data|
      MusicAlbum.new(
        album_data['title'],
        album_data['publisher'],
        album_data['on_spotify'],
        album_data['publish_date']
      )
    end
  else
    []
  end
end

# list genre function

def list_genres
  load_genres
  if $genres.empty?
    puts 'No genres found.'
  else
    puts 'List of genres:'
    $genres.each do |genre|
      puts "- #{genre.name}"
    end
  end
end

# add genre function

def add_genre
  puts 'Enter the name of the new genre:'
  genre_name = gets.chomp
  new_genre = Genre.new(genre_name)
  $genres << new_genre
  puts "Genre '#{genre_name}' added successfully."
  save_genres
  genre_name
end

# list albums

def list_music_albums
  $music_albums = load_albums
  puts 'List of Music Albums:'
  $music_albums.each do |album|
    puts "- #{album.title} by #{album.publish_date}"
  end
end

# add music album function

def add_music_album
  title = album_title
  publisher = album_publisher
  publish_date = publish_date_get
  on_spotify = spotify_status

  new_album = MusicAlbum.new(title, publisher, on_spotify, publish_date)
  $music_albums << new_album

  puts "Album '#{title}' by #{publisher} added successfully."
  save_albums
end

def album_title
  puts 'Enter the title of the new album:'
  gets.chomp
end

def album_publisher
  puts 'Enter the publisher:'
  gets.chomp
end

def publish_date_get
  loop do
    print 'Enter the publish date (YYYY-MM-DD): '
    publish_date_input = gets.chomp
    return publish_date_input if /\A\d{4}-\d{2}-\d{2}\z/.match(publish_date_input)

    puts 'Invalid input. Please enter the date in the format YYYY-MM-DD.'
  end
end

def spotify_status
  loop do
    print 'Is it on Spotify? (true/false): '
    on_spotify_input = gets.chomp.downcase
    return on_spotify_input == 'true' if %w[true false].include?(on_spotify_input)

    puts 'Invalid input. Please enter "true" or "false".'
  end
end

def save_genres
  File.open('db/json/genres.json', 'w') do |file|
    file.puts(JSON.generate($genres))
    puts 'Genres saved successfully.'
    puts "Genres: #{$genres}"
  end
end

def save_albums
  File.open('db/json/albums.json', 'w') do |file|
    file.puts(JSON.generate($music_albums))
    puts "Album #{$music_albums} saved successfully."
  end
end
