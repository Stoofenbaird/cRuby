#!/usr/bin/ruby

# source: http://ruby-doc.org/docs/Tutorial/part_02/conditionals.html

puts "A program to determine the highest power of 2"\
	+ " for a given number.\n"
puts "Enter an integer (no decimals or fractions, please): "
user_number = gets.chomp.to_i
exp = 0
x = 2
while 2 ** (exp +1) < user_number
	x = 2 ** exp
	exp += 1
end

puts "2^" + exp.to_s + " = " + x.to_s + \
" is the highest power of 2 less than " + user_number.to_s

