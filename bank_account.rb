#A Treehouse exercise for Ruby Objects and Classes

class BankAccount
	attr_reader :name

	def initialize(name)
		@name = name
		@transactions = []
		add_transaction("Beginning Balance", 0)
	end

	def credit(description, amount)
		add_transaction(description, amount)
	end

	def debit(description, amount)
		add_transaction(description, -amount)
	end

	def add_transaction(description, amount)
		@transactions.push(description: description, amount: amount)
	end

	def balance
		balance = 0
		@transactions.each do |transaction|
			balance += transaction[:amount]
		end
		return balance
	end
# a ts string method can be useful within many programs
	def to_s
		#To get the balance to print as a floating pt number with 2 decimal points,
		#use sprintf and "%0.2f" as the first arg.
		# Note that video has ) after balance instead of after .2f" - generated an error for me.
		# Also needed to use '' instead of " " to start/end line.
		'Name: #{name}, Balance: #{sprintf("%0.2f"), balance}'
	end	

	def print_register
		puts "#{name}'s Bank Account"
		puts "-" * 40

		puts "Description".ljust(30) + "Amount".rjust(10)
		@transactions.each do |transaction|
			# with line jsutification and conversion to 2-pt float
			puts transaction[:description].ljust(30) + sprintf("%0.2f", transaction[:amount]).rjust(10)
		end
		puts "-" * 40
		# This line generates an error indicating that sprintf has too few arguments, though the program runs.
		# Adding 0 as a second arg lets the prog run but generates a new error of undefined method 'rjust' on line 67
		puts "Balance:".ljust(30) + sprintf("%0.2f", 0), balance.rjust(10)
		puts "-" * 40
	end
end

# Test run of code
	# Instantiate a new instance of BankAccount
bank_account = BankAccount.new("Jason")
puts bank_account.inspect
bank_account.credit("Paycheck", 100)
bank_account.debit("Groceries", 40)
#To get the balance to print as a floating pt number with 2 decimal points,
#use sprintf and "%0.2f" as the first arg.
puts bank_account
puts "Register:"
bank_account.print_register