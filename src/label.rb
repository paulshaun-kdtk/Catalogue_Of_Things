require 'json'

class Label
  attr_accessor :items, :title, :color

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  # Serializing data to json
  def label_to_json
    {
      title: @title,
      color: @color
    }
  end

  # Deserializing data from json
  def self.from_json(json_hash)
    new(json_hash['title'], json_hash['color'])
  end
end

def save_labels(labels)
  File.write('db/labels.json', JSON.generate(labels.map(&:label_to_json)))
end

def load_labels
  loaded_labels = []
  if File.exist?('storage/labels.json')
    data = JSON.parse(File.read('storage/labels.json'))
    data.each do |label_data|
      loaded_labels << Label.from_json(label_data)
    end
  end

  loaded_labels
end
