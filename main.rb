require './book'
require './person'

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
  when 7
    puts 'Thank you for using this app!'
  end
end

puts 'Welcome to School Library App'
main
