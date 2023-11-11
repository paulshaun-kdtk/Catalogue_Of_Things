require 'date'
require_relative '../src/classes/game'
require 'rspec'

describe Game do
  let(:game) { Game.new('2020-01-01', '2022-01-01') }
  it 'cannot be archived if last played is within 2 years' do
    game.last_played_at = (Date.today - 365).to_s
    expect(game.can_be_archived?).to be(false)
  end
end
