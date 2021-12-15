require './person'
require './classroom'
# Class Student file.
class Student < Person
  attr_accessor :classroom

  def constructor(clasroom)
    super
    @clasroom = clasroom
  end

  def play_hook
    '¯\(ツ)/¯'
  end
end
