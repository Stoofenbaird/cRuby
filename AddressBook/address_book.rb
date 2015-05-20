#A Ruby exercise from Treehouse

#access other files
require "./contact"
require "yaml"


class AddressBook
	attr_reader :contacts

	def initialize
		@contact = []
		open()
	end
=begin
		remove begin/end comment tags to activate this code for test/live
	def open
		if File.exist?("contact.yml")
			@contacts = YAML.load_file("contacts.yml")
		end
	end
=end
	def save
		# the "W" tells yml that we are going to write to the file
		#the file.open method takes 2 args: the file to open and the mode
		File.open("contacts.yml", "w") do |file|
			file.write(contact.to_yaml)
		end
	end

	def run
		loop do
			puts "Address Book"
			pust "a: Add Contact"
			puts "p: Print Address Book"
			puts "s: Search"
			puts "e: Exit"
			print "Enter your choice: "
			input = gets.chomp.downcase
			case input
			when 'a'
				add_contact
			when 'p'
				print_contact_list
			when 's'
				print "Search term: "
				search = gets.chomp
				find_by_name(search)
				find_by_phone_number(search)

			when 'e'
				save()
				break
			end
		end
	end

	def add_contact
		contact = Contact.new
		print "First name: "
		contact.first_name = gets.chomp
		print "Middle name: "
		contact.middle_name = gets.chomp
		print "Last name: "
		contact.last_name = gets.chomp
		contacts.push(contact)

		loop do
			puts "Add phone number or address? "
			puts "p: Add phone number"
			puts "a: Add address"
			puts "(Any other key to go back)"
			response = gets.chomp.downcase
			case response
			when 'p'
				phone = PhoneNumber.new
				print "Phone number kind (Home, Work, etc): "
				phone.kind = gets.chomp
				print "Number: "
				phone.number = gets.chomp
				contact.phone_numbers.push(phone)
			when 'a'
				address = Address.new
				print "Address Kind (Home, Work, etc): "
				address.kind = gets.chomp
				print "Address line 1: "
				address.street_1 = gets.chomp
				print "Address line 2: "
				address.street_2 = gets.chomp
				print "City: "
				address.city = gets.chomp
				print "State: "
				address.state = gets.chomp
				print "Postal Code: "
				address.postal_code - gets.chomp
				contact.addresses.push(address)
			else
				print "\n"
				break
			end
		end
		contacts.push(contact)
	end	

	# a composite print method for search results
	def print_results(search, results)
		puts search
		results.each do |contact|
			puts contact.to_s('full_name')
			contact.print_phone_numbers
			contact.print_addreses
			puts "\n"
		end
	end

# a method to search the contacts and add hits to a results array
# The method takes "name" as an argument
	def find_by_name(name)
		results = []
		search = name.downcase
		contacts.each do |contact|
			if contact.first_name.downcase.include?(search) ||
				contact.last_name.downcase.include?(search)
				#alternatively could search for full_name
				results.push(contact)
			end
		end
		print results ("Name search results (#{search})", results) 
		
#lines removed and added to composite search print method
#		results.each do |contact| 
#			puts.contact.to_s('full_name')
#			contact.print_phone_numbers
#			contact.print_addreses
#			puts "\n"
#		end
		end
	end

	#a method to search by phone number and generate an array of results
	def find_by_phone_number(number)
		results = []
		#take the input search number, remove the dashes and replace with no spaces
		search = number.gsub("-", "")
		contacts.each do |contact|
			contact.phone_numbers.each do |phone_number|
				if phone_number.number.gsub("-", "").include?(search)
					results.push(contact) unless results.include?(contact)
					#the unless portion prevents one name from being a result more than once
					#in a single search (i.e., a searched letter is in both first and last names)
				end
			end
		end
		#a method to output the search results
		print_results ("Phone search results (#{search})", results) 
#		results.each do |contact|
#			puts.contact.to_s('full_name')
#			contact.print_phone_numbers
#			contact.print_addreses
#			puts "\n"
	end

	def find_by_address(query)
		results = []
		search = query.downcase
		contacts.each do |contact|
			contact.addresses.each do |address|
				if address.to_s('long').downcase.include?(search)
					results.push(contact) unless results.include?(contact)
				end
			end
		end

		print_results("Adress search results (#{search})", results)
	end	

	def print_contact_list
		puts "Contact List"
		contacts.each do |contact|
			puts contact.to_s('last_first')
		end
	end

end

#test-run for console by instatiating a new address AddressBook
address_book = AddressBook.new
address_book.run

jason = Contact.new
jason.first_name = "Jason"
jason.last_name = "Seiffer"
jason.add_phone_number("Home", "123-456-7890")
jason.add_phone_number("Work", "456-789-0123")
jason.add_address("Home", "123 Main St.", "", "Portland", "OR", "12345")


purple = Contact.new
purple.first_name = "Purple"
purple.last_name = "Crayon"
purple.add_phone_number("Home", "123-456-7780")
purple.add_phone_number("Work", "123-456-7781")
purple.add_address("Home", "No.4 2nd Row", "Compartment B Ave", "Box City", "OR", "45678")

address_book.contacts.push(jason)
address_book.contact.push(purple)
address_book.print_contact_list
#search by name, letter in a name, part of a phone number or address
address_book.find_by_name("purple")
address_book.find_by_name("n")
address_book.find_by_phone_number("781")
address_book.find_by_name("city")