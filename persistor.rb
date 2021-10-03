require 'json'

class Persistor
  def hydrate(classroom)
    people_json = File.read('people.json')
    books_json = File.read('books.json')
    rentals_json = File.read('rentals.json')

    books = JSON.parse(books_json, create_additions: true)
    people = parse_people(people_json, classroom)
    rentals = parse_rentals(rentals_json, people, books)

    {
      'people' => people,
      'books' => books,
      'rentals' => rentals
    }
  end

  def parse_rentals(rentals_json, people, books)
    JSON.parse(rentals_json).map do |rental_json|
      book = books.find { |book| book.title == rental_json['book_title'] }
      person = people.find { |person| person.id == rental_json['person_id'].to_i }

      Rental.new(rental_json['date'], book, person)
    end
  end

  def parse_people(people_json, classroom)
    JSON.parse(people_json).map do |person_json|
      id = person_json['id'].to_i
      name = person_json['name']
      age = person_json['age']

      if person_json['json_class'] == 'Student'
        parent_permission = person_json['parent_permission']
        student = Student.new(name: name, age: age, parent_permission: parent_permission, classroom: classroom)
        student.id = id
        student
      else
        specialization = person_json['specialization']
        teacher = Teacher.new(name: name, age: age, specialization: specialization)
        teacher.id = id
        teacher
      end
    end
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
