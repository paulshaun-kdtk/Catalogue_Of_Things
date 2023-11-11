require_relative 'spec_helper'

describe Label do
  before :each do
    @label = Label.new('Mastery', 'Red')
  end

  let(:title) { 'Label Title' }
  let(:color) { 'Red' }

  subject(:label) { described_class.new(title, color) }

  describe '#initialize' do
    it 'creates a new Label object' do
      expect(label).to be_a(Label)
    end

    it 'sets the title and color' do
      expect(label.title).to eq(title)
      expect(label.color).to eq(color)
    end
  end

  it 'add a new item' do
    @book = Book.new('2023-11-08', 'Publisher Name', 'Good')
    @item = Items.new(@book)
    @label.add_item(@item)
    @label.items.should_not be_empty
  end

  it 'label to json' do
    @new_label = @label
    @json = { title: 'Mastery', color: 'Red' }
    @new_label.label_to_json.should eql @json
  end

  describe '.from_json' do
    let(:json_data) { { 'title' => title, 'color' => color } }

    it 'creates a new Label from JSON data' do
      loaded_label = described_class.from_json(json_data)
      expect(loaded_label).to be_a(Label)
      expect(loaded_label.title).to eq(title)
      expect(loaded_label.color).to eq(color)
    end
  end
end
