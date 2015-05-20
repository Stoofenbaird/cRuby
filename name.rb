# A Treehouse exercise for Ruby Objects and Classes - with comments.
class Name
	#attribute reader to replace multiple methods 
	#attr_reader :title, :first_name, :middle_name, :last_name
	#attribute writer to replace methods for allowing new input/variable values
	#attr_writer :title
	#attribute accessor can combine the reader and writers into one line.  
	#Use reader, writer or accessor depending on if variable will always be read, always be
	#written or sometimes do either one.
	attr_accessor :title, :first_name, :middle_name, :last_name

	#the initialize method makes the vairables available to all methods within the class
	def initialize(title, first_name, middle_name, last_name)
		@title = title  
		@first_name = first_name
		@middle_name = middle_name
		@last_name = last_name
	end
# Methods below are replaced by shortcut attr_reader
	#	def title
		# return the instance variable for each method
	# 	@title
	# end

	# def first_name
	# 	@first_name
	# end

	# def middle_name
	# 	@middle_name
	# end

	# def last_name
	# 	@last_name
	# end

# A method to change the value of an initialized variable
# The method name will be the same as the original variable
# This method will be replaced by the attr_writer line
#	def title=(new_title)
#		@title = new_title
#	end

	def full_name
		# an implicit return
		@first_name + " " + @middle_name + " " + @last_name
	end

	def full_name_with_title
		# calls on the method above for help
		@title + " " + full_name()
	end

end

#test run of code for a vairiety of output

name = Name.new("Mr.", "Jason", "", "Seifer")
puts name.title + " " +
	 name.first_name + " " +
	 name.middle_name + " " +
	 name.last_name 
puts name.title + " " + name.full_name
puts name.full_name_with_title

# Each instance of the class will have access only to the variable values 
#generated within its instance (Local variables).  This test runs but generates one error of undefined local var 'nick'
name = Name.new("Mr.", "Nick", "", "Pettit")
puts nick.full_name_with_title

puts "Title: #{name.title}"
name.title = "Dr."
puts "Title: #{name.title}"

