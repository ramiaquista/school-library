# frozen_string_literal: false

# Class Student file.
class Student < Person
  def constructor(clasroom)
    super
    @clasroom = clasroom
  end

  def play_hook
    '¯\(ツ)/¯'
  end
end
