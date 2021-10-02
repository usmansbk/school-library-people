require_relative 'corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name: "Unknown", age:, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @corrector = Corrector.new
  end

  def can_use_services?
    is_of_age || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name @name
  end

  private

  def is_of_age?
    @age >= 18
  end
end
