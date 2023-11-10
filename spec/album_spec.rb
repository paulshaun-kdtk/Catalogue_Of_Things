require_relative '../src/classes/genre'
require_relative '../src/classes/album'

describe MusicAlbum do
  let(:album) { MusicAlbum.new('Title', 'Publisher', true, '2012-12-31') }

  it 'can be archived if publish date is before 2013-01-01' do
    expect(album.can_be_archived?).to be(true)
  end

  it 'cannot be archived if publish date is on or after 2013-01-01' do
    album.publish_date = '2013-01-01'
    expect(album.can_be_archived?).to be(false)
  end
end
