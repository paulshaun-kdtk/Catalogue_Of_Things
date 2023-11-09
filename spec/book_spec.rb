require_relative 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('2023-11-08', 'Publisher Name', 'Good')
  end

  let(:publish_date) { '2023-11-08' }
  let(:publisher) { 'Publisher Name' }
  let(:cover_state) { 'Good' }

  subject(:book) { described_class.new(publish_date, publisher, cover_state) }

  describe '#initialize' do
    it 'creates a new Book object' do
      expect(book).to be_a(Book)
    end

    it 'sets the publish date, publisher, and cover state' do
      expect(book.publish_date).to eq(publish_date)
      expect(book.publisher).to eq(publisher)
      expect(book.cover_state).to eq(cover_state)
    end
  end

  describe '#can_be_archived?' do
    context 'when cover state is bad' do
      let(:cover_state) { 'Bad' }

      it 'returns true' do
        expect(book.can_be_archived?).to be true
      end
    end

    context 'when cover state is not bad' do
      let(:cover_state) { 'Good' }

      it 'returns false' do
        expect(book.can_be_archived?).to be false
      end
    end

    context 'when cover state is bad and parent can be archived' do
      let(:cover_state) { 'Bad' }

      it 'returns true' do
        allow_any_instance_of(Items).to receive(:can_be_archived?).and_return(true)
        expect(book.can_be_archived?).to be true
      end
    end
  end

  it 'book to json' do
    @new_book = @book
    @json = { publish_date: '2023-11-08', publisher: 'Publisher Name', cover_state: 'Good' }
    @new_book.book_to_json.should eql @json
  end

  it 'book from json' do
    @aux = @book
    @json_book = @aux.book_to_json
    Book.from_json(@json_book).should be_an_instance_of Book
  end

  it 'Save books' do
    books = [Book.new('1999-11-11', 'Penguin', 'Bad'), Book.new('2023-11-10', 'Longhorn', 'Good')]

    allow(File).to receive(:write)
    save_books(books)

    expect(File).to have_received(:write).with('storage/books.json', anything)
  end

  it 'load books from a file' do
    allow(File).to receive(:exist?).and_return(true)
    allow(File).to receive(:read).and_return('[{"publish_date":"1999-11-11","publisher":"Penguin","cover_state":"Bad"}]')

    loaded_books = load_books

    expect(loaded_books.size).to eq(1)
    expect(loaded_books[0].publish_date).to eq('1999-11-11')
    expect(loaded_books[0].publisher).to eq('Penguin')
    expect(loaded_books[0].cover_state).to eq('Bad')
  end
end
