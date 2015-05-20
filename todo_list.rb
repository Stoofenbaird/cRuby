require "./todo_item"

class TodoList
	attr_reader :name, :todo_items

	def initialize(name)
		@name = name
		@todo_items = []
	end

	def add_item(name)
		# instantiate a new Todo item with name as arg and push to array
		todo_items.push(TodoItem.new(name))		
	end

	def remove_item(name)
		if index = find_index(name)
			todo_items.delete_at(index)
			return true
		else
			return false
		end
	end

	def mark_complete(name)
		if index = find_index(name)
			todo_items[index].mark_complete!
			return true
		else
			return false
		end
	end

	def find_index(name)
		index = 0
		found = false
		todo_items.each do |todo_item|
			if todo_item.name == name
				found = true
			end
			if found
				break
			else
				index += 1
			end
		end
		if found
			return index
		else
			return nil			
		end
	end

	def print_list(kind='all')
		puts "#{name} List - #{kind} items"
		puts "-" * 30
		tod_items.each do |todo_item|
			case kind
			when 'all'
				puts todo_item
			when 'complete'
				puts todo_itemif todo_item.complete?
			end
		end
		puts "\n"
	end
end


# Test run of code

todo_list = TodoList.new("Groceries")
todo_item = TodoItem.new("Milk")
todo_item = TodoItem.new("Bread")
todo_item = TodoItem.new("Butter")


# puts todo_list.inspect
# puts todo_item.inspect

# puts todo_item
# todo_item.mark_complete!
# puts todo_item
# todo_item.mark_incomplete!
# puts todo_item
# todo_list.add_item("Milks")
todo_list.add_item("Eggs")
puts todo_list.inspect
if todo_list.remove_item("Eggs")
	puts "Eggs were removed from the list."
end

if todo_list.mark_complete("Milk")
	puts "Milk was marked as complete."
end

puts "\n"

