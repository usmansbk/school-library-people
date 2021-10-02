#!/usr/bin/env ruby

class App
  def list_books
  end

  def list_people
  end

  def create_person_type
  end

  def create_book
  end

  def create_rental
  end

  def list_rentals_by_person_id
  end

  def print_welcome
    puts
  end

  def run
    puts "Welcome to School Library App!"

    loop do 
      print_options
      option = gets.chomp 

      case option
      when '1'
        list_books
      when '2'
        list_people
      when '3'
        create_person_type
      when '4'
        create_book
      when '5'
        create_rental
      when '6'
        list_rentals_by_person_id
      when '7'
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
end

def main
  app = App.new
  app.run
end

main
