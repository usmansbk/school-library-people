require_relative 'spec_helper'

describe Rental do
  describe '#new' do
    person = Person.new(age: 17)
    book = Book.new('Game of thrones', 'Tolkien')

    rental = Rental.new('2020/04/12', book, person)

    it 'takes 3 parameters and returns a Rental object' do
      expect(rental).to be_an_instance_of Rental
    end

    it 'should set the correct date' do
      expect(rental.date).to eq '2020/04/12'
    end

    it 'should set the correct person' do
      expect(rental.person).to eq person
    end

    it 'should set the correct book' do
      expect(rental.book).to eq book
    end
  end
end
