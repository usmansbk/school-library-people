require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(name: 'Unknown', age:, parent_permission: true, classroom:)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_s
    '[Student] ' + super
  end
end
  