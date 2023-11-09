require_relative 'item'
require 'json'

class Book < Items
  attr_accessor :publisher, :cover_state, :label, :publish_date

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @label = nil
  end

  def can_be_archived?
    super || @cover_state == 'Bad'
  end

  # Serialize the object to a hash
  def book_to_json
    {
      publish_date: @publish_date,
      publisher: @publisher,
      cover_state: @cover_state
    }
  end

  # Deserialize the hash back into an object
  def self.from_json(json_hash)
    new(json_hash['publish_date'], json_hash['publisher'], json_hash['cover_state'])
  end
end

def save_books(books)
  File.write('storage/books.json', JSON.generate(books.map(&:book_to_json)))
end

def load_books
  loaded_books = []
  if File.exist?('storage/books.json')
    data = JSON.parse(File.read('storage/books.json'))
    data.each do |book_data|
      loaded_books << Book.from_json(book_data)
    end
  end

  loaded_books
end
