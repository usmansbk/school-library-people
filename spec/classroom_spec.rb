require_relative 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Microverse')
  end

  describe '#new' do
    it 'takes one parameter and returns a Classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  describe '#students' do
    it 'returns a has-many Student relationship' do
      expect(@classroom).to have_attributes('students' => [])
    end
  end

  describe '#label' do
    it 'returns the correct label' do
      expect(@classroom.label).to eq 'Microverse'
    end
  end
end
