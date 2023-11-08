require_relative '../classes/album'
require_relative '../classes/genre'

genres = []
music_albums = []


# list genre function

def list_genres(genres)
  if genres.empty?
    puts 'No genres found.'
  else
    puts 'List of genres:'
    genres.each do |genre|
      puts "- #{genre.name}"
    end
  end
end
# add genre function

def add_genre(genres)
  puts 'Enter the name of the new genre:'
  genre_name = gets.chomp
  new_genre = Genre.new(genre_name)
  genres << new_genre
  puts "Genre '#{genre_name}' added successfully."
  return genre_name
end

# list albums

def list_music_albums(music_albums)
  puts 'List of Music Albums:'
  music_albums.each do |album|
    puts "#{album.title} by #{album.publisher}"
  end
end


# add music album function

def add_music_album(music_albums)
  puts 'Enter the title of the new album:'
  title = gets.chomp
  puts 'Enter the publisher:'
  publisher = gets.chomp

  can_be_archived = nil
  on_spotify = nil

  loop do
    print 'Can it be archived? (true/false): '
    can_be_archived_input = gets.chomp.downcase
    if can_be_archived_input == 'true' || can_be_archived_input == 'false'
      can_be_archived = can_be_archived_input == 'true'
      break
    else
      puts 'Invalid input. Please enter "true" or "false".'
    end
  end

  loop do
    print 'Is it on Spotify? (true/false): '
    on_spotify_input = gets.chomp.downcase
    if on_spotify_input == 'true' || on_spotify_input == 'false'
      on_spotify = on_spotify_input == 'true'
      break
    else
      puts 'Invalid input. Please enter "true" or "false".'
    end
  end

  new_album = MusicAlbum.new(title, publisher, can_be_archived, on_spotify)
  music_albums << new_album
  puts "Album '#{title}' by #{publisher} added successfully."
end


# Main menu tp be refactored
loop do
  puts 'Options:'
  puts '1. List all music albums'
  puts '2. List all genres'
  puts '3. Add a genre'
  puts '4. Add a music album'
  puts '5. Exit'

  choice = gets.chomp.to_i

  case choice
  when 1
    list_music_albums(music_albums)
  when 2
    list_genres(genres)
  when 3
    add_genre(genres)
  when 4
    add_music_album(music_albums)
  when 5
    break
  else
    puts 'Invalid option. Please choose a valid option.'
  end
end
