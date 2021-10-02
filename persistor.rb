require 'json'

class Persistor
  def persist(people:)
    json = JSON.generate(people)

    puts json
  end
end
