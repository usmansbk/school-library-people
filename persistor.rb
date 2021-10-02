require 'json'

class Persistor
  def persist(people:, rentals:, books:)
    people_json = JSON.generate(people)
    books_json = JSON.generate(books)
    rentals_json = JSON.generate(rentals)

    puts people_json
    puts books_json
    puts rentals_json
  end
end
