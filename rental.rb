class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def to_s
    "Date: #{@date}, Book \"#{book.title}\" by #{book.author}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'date' => @date,
      'book_title' => @book.title,
      'person_id' => @person.id
    }.to_json(*args)
  end
end
