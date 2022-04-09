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

  def create_student
    print 'Age: '
    student_age = gets.chomp.to_i
    print 'Name: '
    student_name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission_response = gets.chomp
    student_permission = permission_response != 'N'

    new_student = Student.new(student_age, student_name, parent_permission: student_permission)
    puts 'Person created succesfully' if new_student.instance_of?(Student)
    people << new_student
  end

  def create_teacher
    print 'Age: '
    teacher_age = gets.chomp.to_i
    print 'Name: '
    teacher_name = gets.chomp
    print 'Specialization: '
    teacher_specialization = gets.chomp

    new_teacher = Teacher.new(teacher_specialization, teacher_age, teacher_name)
    puts 'Person created succesfully' if new_teacher.instance_of?(Teacher)
    people << new_teacher
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_selection = gets.chomp.to_i
    case person_selection
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Wrong value. Please try again :)'
    end
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp

    new_book = Book.new(book_title, book_author)
    puts 'Book created successfully' if new_book.instance_of?(Book)
    books << new_book
  end

  def option_run(selection)
    case selection
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    else
      puts 'Wrong value. Please try again :)'
    end
  end

  def run
    puts 'Welcome to School Library App!'
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
