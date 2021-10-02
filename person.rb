require_relative 'corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age:, parent_permission: true, name: 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name
    corrector = Corrector.new
    @name = corrector.correct_name @name
  end

  private

  def of_age?
    @age >= 18
  end

  def to_s
    "Name: #{@name}, ID: #{@id}, Age: #{@age}"
  end
end
