require_relative '../src/classes/genre'
require_relative '../src/classes/album'

RSpec.describe Genre do
  let(:genre) { described_class.new("Rock") }
  let(:music_album) { MusicAlbum.new("Album Title", "Publisher", true, 15) }

  it 'adds item' do
    expect(genre.items).to be_empty
    genre.add_item(music_album)
    expect(genre.items.length).to eq(1)
    expect(music_album.genre).to eq(genre)
  end

  # it 'to_json' do
  #   # Add tests for to_json method if needed
  # end
end
