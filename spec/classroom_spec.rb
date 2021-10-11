require_relative 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Microverse')
    @student = Student.new(age: 17, classroom: @classroom)
    @classroom.add_student @student
  end

  describe '#new' do
    it 'takes one parameter and returns a Classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  describe '#students' do
    it 'returns a has-many Student relationship' do
      expect(@classroom).to have_attributes('students' => [@student])
    end
  end

  describe '#label' do
    it 'returns the correct label' do
      expect(@classroom.label).to eq 'Microverse'
    end
  end

  describe '#add_student' do
    context 'classroom' do
      it 'should add a student' do
        expect(@classroom.students).to include(@student)
      end
    end

    context 'student' do
      it 'should be in the correct classroom' do
        expect(@student.classroom).to eq @classroom
      end
    end
  end
end
