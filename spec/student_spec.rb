require_relative 'spec_helper'

describe Student do
  before :each do
    @classroom = Classroom.new('MV2.0')
    @student = Student.new(age: 18, classroom: @classroom)
  end

  describe '#new' do
    it 'takes 2 required parameters and returns a Teacher object' do
      expect(@student).to be_an_instance_of Student
    end

    it 'should be added to the correct classroom' do
      expect(@student.classroom).to eq @classroom
    end
  end

  describe '#play_hooky' do
    it 'should print the correct message' do
      expect(@student.play_hooky).to eq '¯\(ツ)/¯'
    end
  end
end
