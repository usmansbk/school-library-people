require 'json'

class Persistor
  def persist(people:, rentals:, books:)
    people_json = JSON.generate(people)
    books_json = JSON.generate(books)
    rentals_json = JSON.generate(rentals)

    File.open("people.json", "w") { |f| f.write people_json }
    File.open("books.json", "w") { |f| f.write books_json }
    File.open("rentals.json", "w") { |f| f.write rentals_json }
  end
end
