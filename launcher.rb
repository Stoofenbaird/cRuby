# Tutorial from http://neurogami.com/content/neurogami-10_minutes_to_your_first_Ruby_app/

#!/usr/bin/env ruby 

#Example application to demonstrate some basic Ruby features
#This code loads a given file into an associated application

# Step 1: Set up the file and Create a variable
class Launcher
	# Step 3: Adding behavior using def keyword, initiailize method and an argument
	def initialize app_map
		@app_map = app_map
	end

	# Step 2: Create an object instance by invoking new on the Launcher class.
	# Step 2a: This line is modified later in the program.  Comment out for now.
	# launcher = Launcher.new

	# Step 4: Execute the given file using the associated app. Take a file name and
	# pass it to select_app  
	def run file_name
		application = select_app file_name
		# system uses Ruby's system method to invoke the application, passing it the file name
		system "#{application} #{file_name}"
	end

	# Given a file, look up the matching application
	def select_app file_name
		ftype = file_type file_name
		@app_map[ ftype ]
	end

	# Return the part of the file name string after the last '.', a normalized file ext.
	# gsub is global substitute
	def file_type file_name
		File.extname( file_name ).gsub( /^\./, '' ).downcase
	end
end
# Step 5: Create an instance of Launcher and use it to run an application
def help
	print "You must pass in the path to the file to launch.
	Usage; #{__FILE__} target_file"
end

unless ARGV.size > 0
	help
	exit
end

app_map = {
	'html' => 'open /Applications/Chrome.app ',
	'rb' => 'vim',
	'jpg' => 'gimp'
}

l = Launcher.new app_map
target = ARGV.join ' '
l.run target 
=begin
Note: When I run ruby launcher.rb launcher.rb in terminal, I get a NameError: undefined locavariable or method 'launcher' for main:Object
	from (irb):1
	from /file_path/.rbenv/versions/2.2.2/bin/irb:11:in '<main>'
=end

