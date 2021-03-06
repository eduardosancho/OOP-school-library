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
    @people.each_with_index do |person, index|
      puts "#{index + 1} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
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
    people << new_student unless people.include?(new_student)
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
    people << new_teacher unless people.include?(new_teacher)
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
    books << new_book unless books.include?(new_book)
  end

  def create_rental
    puts "\nSelect a book from the following list by number:"
    list_all_books
    selected_book_index = gets.chomp.to_i
    selected_book = books[selected_book_index - 1]

    puts "\nSelect a person from the following list by number (not id):"
    list_all_people
    selected_person_index = gets.chomp.to_i
    selected_person = people[selected_person_index - 1]

    print 'Date: '
    rental_date = gets.chomp

    new_rental = Rental.new(rental_date, selected_person, selected_book)
    puts 'Rental created successfully' if new_rental.instance_of?(Rental)
    rentals << new_rental unless rentals.include?(new_rental)
    selected_person.rentals << new_rental unless selected_person.rentals.include?(new_rental)
    selected_book.rentals << new_rental unless selected_book.rentals.include?(new_rental)
  end

  def list_rentals_by_id
    list_all_people
    print 'ID of person: '
    selected_person_id = gets.chomp.to_i
    selected_person = people.select { |person| person.id == selected_person_id }
    puts 'Rentals: '
    selected_person[0].rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}, Person: #{rental.person.name}"
    end
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
    when 5
      create_rental
    when 6
      list_rentals_by_id
    else
      puts 'Wrong value. Please try again :)'
    end
  end
end
