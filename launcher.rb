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
launcher = Launcher.new

