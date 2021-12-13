# Class Person file.
class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    true if Person._is_of_age? || Person.parent_permission
  end

  private

  # Naming/PredicateName: Rename is_of_age? to of_age? Rubocop error, that's why I have changed the name
  def of_age?
    true if @age >= 18
  end
end
