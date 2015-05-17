#! /usr/bin/ruby

# source: http://ruby-doc.org/docs/Tutorial/part_02/conditionals.html

# If/else conditional statements.  Order of if/else values is importamt.  FIrst true one will execute.


puts "How old are you?"
age = gets.chomp.to_i

if age >= 60
	puts "Senior fare"
elsif age >= 14
	puts "Adult fare"
	elsif age > 2 
		puts "Child fare"
	else 
		puts "Free"
	end

puts "\n\n"

# Ascii order exercise.  Put in ASCIIbetical order - don't use an array.

	item1 = '2' 
	item2 = 'u'
	item3 = 'A'
	item4 = '4'
	item5 = 'w'
	item6 = 'f'
	item7 = 'R'
	item8 = 'y'

	puts "Items: " + item1 + " ," + item2 + " ," + item3 + " ," + item4 + " ," + item5 + " ,"\
		 + item6 + " ," + item7 + " ," + item8 + "."

	

		
			


