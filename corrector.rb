class Corrector
  def correct_name(name)
    name.capitalize
    name.truncate(10)
  end
end