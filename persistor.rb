require 'json'

class Persistor
  def hydrate(classroom)
    books = parse_books 
    people = parse_people(classroom)
    rentals = parse_rentals(people, books)

    {
      'people' => people,
      'books' => books,
      'rentals' => rentals
    }
  end

  def parse_books
    file = 'books.json'

    if !File.exists? file
      []
    else
      JSON.parse(File.read(file), create_additions: true)
    end
  end

  def parse_rentals(people, books)
    file = 'rentals.json'

    if !File.exists? file
      []
    else
      JSON.parse(File.read(file)).map do |rental_json|
        book = books.find { |book| book.title == rental_json['book_title'] }
        person = people.find { |person| person.id == rental_json['person_id'].to_i }

        Rental.new(rental_json['date'], book, person)
      end
    end
  end

  def parse_people(classroom)
    file = 'people.json'

    if !File.exists? file
      return []
    else
      JSON.parse(File.read(file)).map do |person_json|
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
