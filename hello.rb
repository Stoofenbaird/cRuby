#!/usr/bin/ruby

# The above line makes the program executable.  It has to be the very 1st line (no blank lines) and
# there can not be a space after the #.
# http://ruby-doc.org/docs/Tutorial/part_01/programs.html

# puts will put an object as a String output

puts "Hello World"

name = "Daniel"
puts "Hello " + name + ". How are you?"

# numeric operators
num1 = 2 + 4 + 6 + 8
num1 /= 5
num2 = 2*3*4
num2 -= num1

puts num2

# To use num2 (an integer) in a string line, it has to be converted to a string
puts "The answer is " + num2.to_s + "."

# Constant variables are intended not to change and are capitalized.
Title = "Tomorrowland"

age = 24
puts name + " is " + age.to_s + " years old and will visit " + Title + " for his birthday."

# Loops

# A simple do loop
4.times do 
	puts "A loop-di-do" 
end

# A counting loop
count = 0
5.times do
	count += 1
	puts "count = " + count.to_s
end

# A counting loop with a sum.  Note one variable equals another variable equals a value

count = sum = 0
11.times do
	count += 1
	sum += count
	puts "sum at " + count.to_s + " = " + sum.to_s
end

# The line wrap via \.  The \ must be the very last thing (not even a space after) on the line
# The line wrap keeps every thing on one line.
puts "This is line one. " + \
	"This is line two. " + \
	"This is line three. " + \
	"This is line four."

# Another counting loop
count = 10
10.times do
	count -= 1
	puts count
end
puts "Lift off!!"

# A loop with factorials

number = 6
count = 0
product = 1

number.times do
	count += 1
	product *= count
end
puts number.to_s + " ! = " \
	+ product.to_s
