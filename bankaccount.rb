class BankAccount
	attr_accessor :customer_name, :type

	def initialize(customer_name, type, number)
		@customer_name = customer_name
		@type = type
		@acct_number = number
	end

	private
	def acct_number
		@acct_number
	end

	public
	def to_s
	str = "My account information is #{@customer_name} #{@type}"
	str += " #{@acct_number[8, 3]}"
	end

end