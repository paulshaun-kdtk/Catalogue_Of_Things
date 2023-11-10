require_relative '../item'

class Game < Items
  attr_accessor :last_played_at

  def initialize(publish_date, last_played_at)
    super(publish_date)
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && last_played_old?
  end

  def to_json
    {
      id: @id,
      publish_date: @publish_date,
      archived: @archived,
      label: @label,
      last_played_at: @last_played_at
    }.to_json
  end

  private

  def last_played_old?
    last_played_date = Date.parse(@last_played_at)
    last_played_date < (Date.today - 365 * 2)
  end
end
