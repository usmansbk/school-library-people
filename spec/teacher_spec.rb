require_relative 'spec_helper'

describe Teacher do
  describe '#new' do
    teacher = Teacher.new(age: 48, specialization: 'Doctor')

    it 'takes 2 required parameters and returns a Teacher object' do
      expect(teacher).to be_an_instance_of Teacher
    end

    it 'should always be allowed to use services' do
      expect(teacher.can_use_services?).to be_truthy
    end
  end
end
