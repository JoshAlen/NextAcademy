def prime_factors(n)
  prime_array = []    
  p = 2
  if n < 2
      return p
  end 
 
  	while n % 2 == 0 || n % 3 == 0 || n % 5 == 0 || n % 7 == 0
  		if n % 2 == 0
  			prime_array << 2
  			n =  n / 2
  		elsif n % 3 == 0
  			prime_array << 3
  			n = n / 3
  		elsif n % 5 == 0
  			prime_array << 5
  			n = n / 5
  		elsif n % 7
  			prime_array << 7
  			n = n / 5
  		end
  	end
 	index = 10
  	while index <=  n
  		if n % index == 0
  			prime_array << index
  			n = n / index
  		end
  		index += 1
  	 end

  	 if n > 1
  	   prime_array << n
  	 end
  	 
  	prime_array
end

p prime_factors(6) # => [2,3]
p prime_factors(8) # => [2,2,2]
p prime_factors(25) # => [5,5]
p prime_factors(123123123) # => [3, 3, 41, 333667]
