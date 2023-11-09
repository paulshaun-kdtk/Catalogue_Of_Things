require_relative '../item'

class Genre
  attr_accessor :id, :name, :items

  def initialize(name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_json(*options)
    {
      id: @id,
      name: @name,
      items: @items.map(&:to_json)
    }.to_json(*options)
  end
end
