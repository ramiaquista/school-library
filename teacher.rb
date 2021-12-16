require './person'
# Class Teacher file.
class Teacher < Person
  def constructor(specialization)
    super
    @specialization = specialization
  end

  attr_reader :specialization

  def can_use_services?
    true
  end
end
