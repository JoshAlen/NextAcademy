require 'csv'
require 'date'
class Person
  # Look at the CSV file
  attr_accessor :id, :first_name, :last_name, :email, :phone_number, :created_at
  def initialize(id, first_name, last_name, email, phone_number, created_at)
    @id = id || "id"
    @first_name = first_name || "first_name"
    @last_name = last_name || "last_name"
    @email = email || "email"
    @phone_number = phone_number || "phone_number"
    @created_at = created_at || "created_at"
  end
  # What attributes should a Person object have?

end

class PersonParser
  attr_reader :file

  def initialize(file)
    @file = file
    @people = nil
    @new_people = []
  end

  def people    
    # If we've already parsed the CSV file, don't parse it again.
    # Remember: @people is +nil+ by default.
    @people = []
    
    CSV.foreach(@file, headers: true) do |row|
      @people << row.to_hash
    end

    return @people if @people
    # We've never called people before, now parse the CSV file
    # and return an Array of Person objects here.  Save the
    # Array in the @people instance variable.
  end


  def add_person(person)
      new_arr = []
      new_arr << person.id
      new_arr << person.first_name
      new_arr << person.last_name
      new_arr << person.email
      new_arr << person.phone_number
      new_arr << person.created_at
      @new_people << new_arr
    if @person
      @Person << person
    else
      @person = []
      @person << person
    end
  end

  def save
    CSV.open(@file, "a+") do |csv|
      @new_people.each do |i|
        csv << i
      end
    end
  end

end

parser = PersonParser.new('people.csv')
puts "There are #{parser.people.size} people in the file '#{parser.file}'."
