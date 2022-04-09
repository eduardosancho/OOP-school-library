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

  def run
    loop do
      puts "Welcome to School Library App!"
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
    end
  end
end
