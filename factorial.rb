# Implement an iterative version of the factorial function
def factorial_iterative(n)
	i = n
	n = 1
	while i != 1
		n *= i
		i -= 1
	end
	n
end

# Implement a recursive version of the factorial function
def factorial_recursive(n)
  return n if n == 1
  factorial_recursive(n-1) * n  
end

puts factorial_recursive(9) == 362880
puts factorial_iterative(10)
