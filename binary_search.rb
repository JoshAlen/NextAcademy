
def binary_search(find, test_array)
	min = 0
	max = test_array.length - 1
  	
  	while  min <= max
  		half_index = ((min + max) / 2).floor
 		if test_array[half_index] == find
 			return half_index
 		elsif test_array[half_index] > find
 			max = half_index - 1		
 		elsif test_array[half_index] < find
 			min = half_index + 1
 		end
  	end
  	return -1
end


test_array=(1..100).to_a

p binary_search(70, test_array)
