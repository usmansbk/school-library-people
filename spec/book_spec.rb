require_relative 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('Lord of the rings', 'Tolkien')
  end

  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#rentals' do
    it 'returns a has-many Rental relationship' do
      expect(@book).to have_attributes("rentals" => [])
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      expect(@book.author).to eq 'Tolkien'
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      expect(@book.title).to eq 'Lord of the rings'
    end
  end

  describe '#to_s' do
    it 'returns a formatted string' do
      expect(@book.to_s).to eq 'Title: "Lord of the rings", Author: Tolkien'
    end
  end

  describe '#to_json' do
    it 'returns a json string of the book' do
      expect(JSON.generate(@book)).to eq '{"json_class":"Book","title":"Lord of the rings","author":"Tolkien"}'
    end
  end
end
