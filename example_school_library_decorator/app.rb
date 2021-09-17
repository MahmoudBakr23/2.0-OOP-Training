require_relative './book'
require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # List all books
  def list_all_books
    if @books.length.positive?
      @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }

    else
      puts 'There are no books at the moment'
    end
  end

  # List all people
  def list_all_people
    if @people.length.positive?
      @people.each do |person|
        puts "name: #{person.name}, age: #{person.age}, id: #{person.id}"
      end
    else
      puts 'Sorry! cannot find person'
    end
  end

  # Create a person
  def create_person
    validate_person
    @people << Student.new(@age, @name, @parent_permission)
    @people << Teacher.new(@age, @specialization, @name)
    puts 'Person created successfully'
  end

  # Validate person

  def validate_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    @person_type = gets.chomp
    if @person_type != '1' && @person_type != '2'
      puts 'Invalid option'
      nil
    end
    if @person_type == '1'
      print 'Age: '
      @age = gets.chomp

      print 'Name: '
      @name = gets.chomp
      print 'Has parent permission? [Y/N]: '
      @parent_permission = gets.chomp
      @parent_permission = @parent_permission.downcase == 'y'
    elsif @person_type == '2'
      print 'Specialization: '
      @specialization = gets.chomp
    end
  end

  # Create a book
  def create_book
    validate_book
    @books << Book.new(@title, @author)
    puts 'Book created successfully'
  end

  def validate_book
    print 'Title: '
    @title = gets.chomp

    print 'Author: '
    @author = gets.chomp
  end

  # Create a rental
  def create_rental
    puts 'Please select a book from the folowing list'
    @books.each_with_index do |book, index|
      puts "#{index}) title: '#{book.title}', author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts 'Please select a person from the following list'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] name: #{person.name}, age: #{person.age}, id: #{person.id}"
    end
    person_index = gets.chomp.to_i

    print 'date: '
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  # List all rentals for a given person id
  def list_all_rentals_for_person_id
    validate_rentals_id
    rentals = @rentals.filter { |rental| rental.person.id == @id }
    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def validate_rentals_id
    print 'ID of person: '
    @id = gets.chomp.to_i
  end
end
