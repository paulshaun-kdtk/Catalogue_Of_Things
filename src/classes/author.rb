require_relative '../item'

class Author
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_json
    {
      name: @name,
      items: @items.map(&:to_json)
    }.to_json
  end

  def self.from_json(json_str)
    data = JSON.parse(json_str)
    author = Author.new(data['name'])
    data['items'].each do |item_data|
      if item_data['last_played_at']
        item = Game.new(item_data['publish_date'], item_data['last_played_at'])
      else
        item = Items.new(item_data['publish_date'])
      end
      item.id = item_data['id']
      item.archived = item_data['archived']
      item.label = item_data['label']
      author.add_item(item)
    end
    author
  end
end
