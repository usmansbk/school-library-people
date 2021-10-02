#!/usr/bin/env ruby

require_relative "person"
require_relative "teacher"
require_relative "student"
require_relative "book"
require_relative "rental"
require_relative "classroom"

class App
  def initialize
    @classroom = Classroom.new("Microverse 2.0")
    @people = []
    @books = []
    @rentals = []
  end

  def run
    puts "Welcome to School Library App!"

    loop do 
      print_options
      option = gets.chomp 

      case option
      when "1"
        list_books
      when "2"
        list_people
      when "3"
        create_person
      when "4"
        create_book
      when "5"
        create_rental
      when "6"
        list_rentals_by_person_id
      when "7"
        break
      else
        puts "That is not a valid option"
      end
    end

    puts "Thank you for using this app!"
  end

  private

  def print_options
    puts
    puts "Please choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"
  end
  
  def list_books
    if @books.length > 0
      @books.each { |book| puts book }
    else
      puts "You haven't added any book"
    end
  end

  def list_people
    if @people.length > 0
      @people.each { |person| puts person }
    else
      puts "You haven't added any person"
    end
  end

  def create_person
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]:"
    option = gets.chomp

    case option
    when "1"
      create_student
    when "2"
      create_teacher
    else
      puts "That is not a valid input"
      return
    end

    puts "Person created successfully"
  end

  def create_student
    print "Age: "
    age = gets.chomp

    print "Name: "
    name = gets.chomp

    print "Has parent permission? [Y/N]: "
    parent_permission = gets.chomp.downcase == "y"

    student = Student.new(name: name, age: age, parent_permission: parent_permission, classroom: @classroom)
    @people.push(student)
  end

  def create_teacher
    print "Age: "
    age = gets.chomp

    print "Name: "
    name = gets.chomp

    print "Specialization: "
    specialization = gets.chomp

    teacher = Teacher.new(name: name, age: age, specialization: specialization)
    @people.push(teacher)
  end

  def create_book
    print "Title: "
    title = gets.chomp

    print "Author: "
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)

    puts "Book created successfully"
  end

  def create_rental
    if @books.length > 0
      puts "Select a book from the following list by number"
      @books.each_with_index { |book, idx| puts "#{idx}) #{book}"}
    else
      puts "No books to rent out"
    end
  end

  def list_rentals_by_person_id
  end

end

def main
  app = App.new
  app.run
end

main
