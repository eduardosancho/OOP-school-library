require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    puts "\n"
    @books.each_with_index do |book, index|
      puts "#{index + 1} Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    puts "\n"
    @people.each do |person|
      puts "#{person.class} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def option_run(selection)
    case selection
    when 1
      list_all_books()
    when 2
      list_all_people()
    else
      puts 'Wrong value. Please try again :)'
    end
  end

  def run
    puts "Welcome to School Library App!"
    loop do
      puts "\nPlease choose an option by entering a number:"
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals'
      puts '7 - Exit'

      selection = gets.chomp.to_i
      break if selection == 7
      option_run(selection)
    end
  end
end
