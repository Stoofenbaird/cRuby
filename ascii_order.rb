#! /usr/bin/ruby

# source: http://ruby-doc.org/docs/Tutorial/part_02/conditionals.html

puts "Make a program that accepts character input and " \
	+ "determines its relative ASCII location.\n"

	puts "Enter a character: "
	user_char = gets.chomp.to_s
	
	



	if user_char <= "0"
		puts "Your character is before 0 in ASCII order."
	elsif "9" <= user_char  && user_char <= "A"
		puts "Your character is after 9 but before A in ASCII order."
	elsif 'Z' <= user_char && user_char <= 'a'
		puts "Your character is after Z but before a in ASCII order."
	elsif 'z' <= user_char
		puts "Your character is after z in ASCII order."
	else
		puts "Your character's ascii value is: " + user_char.ord.to_s
	end