#A Ruby exercise from Treehouse
#call another file for code:
require "./phone_number"
requere "./address"

#create a class and add definitions and methods
class Contact
	#utilizing code from this file
	attr_writer :first_name, :middle_name, :last_name
	#utilizing code from other files (requires initialization)
	attr_reader :phone_numbers, :addresses

#initialize the classes from other files with empty arrays
	def initialize
		@phone_numbers = []
		@addresses = []
	end
#create methods for the contact information
	def add_phone_number(kind, number)
		phone_number = PhoneNumber.new
		phone_number.kind = kind
		phone_number.number = number
		#append to the phone_numbers array
		phone_numbers.push(phone_number)
	end

	def add_address(kind, street_1, street_2, city, state, postal_code)
		address = Address.new
		address.kind = kind
		address.street_1 = street_1
		address.street_2 = street_2
		address.city = city
		address.state = state
		address.postal_code = postal_code
		#append to the addresses array
		addresses.push(address)
	end

	def first_name
		@first_name
	end

	def middle_name
		@middle_name
	end

	def last_name
		@last_name
	end

	def first_last
		first_name + " " + last_name
	end

	def last_first
		last_first = last_name
		last_first += ", "
		last_first += first_name
		#check for middle name
		if !@middle_name.nil?
			#if not nil, then build name
			last_first += " "
			#take only first initial of middle
			last_first += middle_name.slice(0, 1)
			last_first += "."
		end
		#with an implicit return
		last_first
	end

	def full_name
		#way one
		#  "#{first_name} #{middle_name} #{last_name}"
		#method way, first figure out if middle name is not supplied:
		full_name = first_name
		if !@middle_name.nil?
			full_name += "  "
			full_name += middle_name
		end
		#if there is a middle name, ignore the if and use this
		full_name += ' '
		full_name += last_name
		#with an implicit return
		full_name
	end

	#override the to-string method
	def to_s(format = 'full_name')
		#using case statements
		case format
		when 'full_name'
			#will return
			full_name
		when 'last_first'
			last_first
		when 'first'
			first_name
		when 'last'
			last_name
		else
			first_last
		end

	end

	def print_phone_numbers
		puts "Phone Numbers"
		#use each method (each takes a block with one argument)
		phone_numbers.each { |phone_number| puts phone_number}
	end

	def print_addresses
		puts "Addresses"
		addresses.each { |address| puts address.to_s('short') }
	end

end

jason = Contact.new
jason.first_name = "Jason"
jason.last_name = "Seiffer"
# test-run for concat 2 requests
puts jason.first_name + " " + jason.last_name
# test-run for full_name single request
puts jason.full_name
# test-run for last-first request
puts jason.last_first
#test-run for to_s
puts jason.to_s('full_name')
puts jason.to_s('last_first')
#test-run for phone number
puts jason.add_phone_number("Home", "123-456-7890")
puts jason.add_phone_number("Work", "456-789-0123")
#test-run for address
jason.add_address("Home", "123 Main St.", "", "Portland", "OR", "12345")
#inspect the Jason contact
puts jason.inspect
#instead of inspect use the print_phone_numbers method
jason.print_phone_numbers
jason.print_addresses



