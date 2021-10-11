require_relative 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(age: "17", name: "Roseling gandalf the gray")
  end

  describe '#new' do
    context 'with only age' do
      person = Person.new(age: "17")

      it 'returns a Person object' do
        expect(person).to be_an_instance_of Person 
      end

      it 'should have an Unknown name' do
        expect(person.name).to eq 'Unknown' 
      end

      it 'should have parent_permission set to true' do
        expect(person.parent_permission).to be_truthy
      end
    end

    context 'with all parameters' do
      person = Person.new(name: 'Rose', age: '17', parent_permission: false)

      it 'takes 3 parameters and returns a Person object' do
        expect(person).to be_an_instance_of Person 
      end

      it 'should set the correct name' do
        expect(person.name).to eq 'Rose' 
      end

      it 'should have parent_permission set to false' do
        expect(person.parent_permission).to be_falsey
      end
    end
  end

  describe '#validate_name' do

  end
end