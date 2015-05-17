#!/usr/bin/ruby

# source: http://ruby-doc.org/docs/Tutorial/part_02/conditionals.html

puts "A program to determine the highest power of 2"\
	+ " for a given number.\n"
puts "Enter an integer (no decimals or fractions, please): "
user_number = gets.chomp.to_i
n = 1
x = 2
while n < user_number
	x = 2**n
	n+=1
end

puts "2^" + n.to_s + " = " + x.to_s + \
" is the highest power of 2 less than " + user_number.to_s

