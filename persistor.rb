require 'json'

class Persistor
  def hydrate
    people_json = File.read('people.json')
    books_json = File.read('books.json')
    rentals_json = File.read('rentals.json')

    people = JSON.parse(people_json, create_additions: true)
    puts people
  end

  def persist(people:, rentals:, books:)
    people_json = JSON.generate(people)
    books_json = JSON.generate(books)
    rentals_json = JSON.generate(rentals)

    File.open('people.json', 'w') { |f| f.write people_json }
    File.open('books.json', 'w') { |f| f.write books_json }
    File.open('rentals.json', 'w') { |f| f.write rentals_json }
  end
end
