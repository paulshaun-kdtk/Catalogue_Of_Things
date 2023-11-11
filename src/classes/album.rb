require_relative '../item'

class MusicAlbum < Items
  attr_accessor :title, :publisher, :on_spotify, :publish_date

  def initialize(title, publisher, on_spotify, publish_date)
    super(publish_date)
    @title = title
    @publisher = publisher
    @on_spotify = on_spotify
 
  end

  def can_be_archived?
    super() && @publish_date < '2013-01-01'
  end

  def to_json(*options)
    {
      title: @title,
      publisher: @publisher,
      on_spotify: @on_spotify,
      publish_date: @publish_date
    }.to_json(*options)
  end
end
