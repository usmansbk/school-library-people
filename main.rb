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
    print_options
    option = get_option ['1', '2', '3', '4', '5', '6', '7']

    while option != '7'
      print_options
      option = get_option ['1', '2', '3', '4', '5', '6', '7']
    end
  end

  private

  def get_option options
    option = gets.chomp
    while !options.include? option
      puts "Invalid option. Valid options are #{options}"
      option = gets.chomp
    end
    option
  end

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
