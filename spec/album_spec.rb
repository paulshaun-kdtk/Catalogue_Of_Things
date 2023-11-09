require_relative '../src/classes/genre'
require_relative '../src/classes/album'

RSpec.describe MusicAlbum do
  let(:music_album) { described_class.new("Album Title", "Publisher", true, 15) }

  it 'can be archived' do
    expect(music_album.can_be_archived?).to be true
  end

  # it 'to_json' do
  #   # Add tests for to_json method if needed
  # end
end
