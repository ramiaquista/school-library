# Class Corrector file.
class Corrector
  def correct_name(name)
    corrected_name = name.capitalize
    corrected_name = corrected_name.slice(0, 10) if name.length > 10
    corrected_name
  end
end
