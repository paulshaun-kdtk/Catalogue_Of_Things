require_relative '../item'

class MusicAlbum < Items
  attr_accessor :title, :publisher,  :can_be_archived, :on_spotify

  def initialize(title, publisher, can_be_archived ,on_spotify)
    super(title)
    @title = title
    @publisher = publisher
    @can_be_archived = can_be_archived
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
