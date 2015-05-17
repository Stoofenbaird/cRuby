#! /usr/bin/ruby

# source: http://ruby-doc.org/docs/Tutorial/part_02/conditionals.html

# If/else conditional statements.  Order of if/else values is importamt.  FIrst true one will execute.
puts "Determine fare based on age: \n"

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