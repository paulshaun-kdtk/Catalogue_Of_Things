require_relative '../src/classes/author'
require_relative '../src/classes/game'
require 'rspec'

describe Author do
  let(:author) { Author.new('John Doe') }

  it 'can add a game to the collection' do
    game = Game.new('2020-01-01', '2022-01-01')
    author.add_item(game)
    expect(author.items).to include(game)
    expect(game.author).to eq(author)
  end
end
