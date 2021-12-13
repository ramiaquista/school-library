# frozen_string_literal: false

# Class Teacher file.
class Teacher < Person
  def constructor(specialization)
    super
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
