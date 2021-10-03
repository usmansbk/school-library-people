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
    it "returns the list of rentals" do
      expect(@book.rentals).to eq []
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
end
