require './book'
require './person'
require './teacher'
require './student'
require './rental'

@books = []
@people = []

def create_student(age, name)
  print 'Has parent permission? [Y/N]: '
  parent_permission = gets.chomp
  parent_permission = parent_permission.capitalize == 'Y'
  student = Student.new(age, parent_permission, name)
  @people.push(student)
  puts 'Student created successfully'
end

def create_teacher(age, name)
  print 'Specialization: '
  specialization = gets.chomp
  teacher = Teacher.new(age, specialization, name)
  @people.push(teacher)
  puts 'Teacher created successfully'
end

# rubocop:disable Metrics/MethodLength
def create_person
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  person_option = gets.chomp
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  case person_option.to_i
  when 1
    create_student(age, name)
  when 2
    create_teacher(age, name)
  end
end

def create_a_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  book = Book.new(title, author)
  puts 'Book created successfully'
  @books.push(book)
end

def create_a_rental
  if @books.empty?
    puts 'No books available'
  else
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: #{book.author}"
    end
    book_to_rental = gets.chomp
    puts ' '
    puts 'Select a person from the following list by number (not id)'
    list_people
    person_is_renting = gets.chomp
    puts ' '
    print 'Date: '
    date_of_rent = gets.chomp
    book = @books[book_to_rental.to_i]
    person = @people[person_is_renting.to_i]
    Rental.new(date_of_rent, book, person)
    puts 'Rental created successfully'
  end
end

def list_books
  @books.each do |book|
    puts "Title: '#{book.title}', Author: #{book.author}"
  end
end

def list_people
  @people.each_with_index do |person, index|
    if person.is_a?(Student)
      puts "#{index}) [Student] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    else
      puts "#{index}) [Teacher] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end
end

def list_rentals_for_person
  print 'ID of person: '
  person_id_input = gets.chomp
  puts 'Rentals:'
  @people.each do |person|
    next unless person.id == person_id_input.to_i

    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}'' by #{rental.book.author}"
    end
  end
end

def list_options
  puts ' '
  puts 'Please choose an option by entering a number: '
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def main
  list_options
  option = gets.chomp
  case option.to_i
  when 1
    list_books
    main
  when 2
    list_people
    main
  when 3
    create_person
    main
  when 4
    create_a_book
    main
  when 5
    create_a_rental
    main
  when 6
    list_rentals_for_person
    main
  else
    puts 'Thank you for using this app!'
  end
end

puts 'Welcome to School Library App'
main
# rubocop:enable Metrics/MethodLength
