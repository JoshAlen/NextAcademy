
#Write a method to_roman that when passed an integer between 1 and 3000 (or so) 
#returns a string containing the proper old-school Roman numeral.
# I 1
# V 5
# X 10
# L 50
# C 100
# D 500
# M 1000
def to_roman(num)
  
      output = ''

      if num
      how_many_thousand = (num - num % 1000) / 1000
       num = num - (num - num % 1000)

      how_many_hundred = (num - num % 100) / 100
       num = num - (num - num % 100)

      how_many_tens = (num - num % 10) / 10
       num = num - (num - num % 10)

      how_many_ones = num - (num - num % 10)
      else
      	return nil
      end

      #adding thousands
      output << 'M' * how_many_thousand
      #adding hundreds
      if how_many_hundred == 9
      	      output << 'CM'
      	elsif how_many_hundred >= 5
      	      output << 'D' + 'C' * (how_many_hundred - 5)
            elsif  how_many_hundred == 4
                  output << 'CD'
            else
                  output << "C" * how_many_hundred
      end
      #adding tens
      if how_many_tens == 9
      	      output << 'XC'
      	elsif how_many_tens >= 5 
      	      output << 'L' + 'X' * (how_many_tens - 5)
            elsif  how_many_tens == 4
                  output << 'XL'
            else
                  output << "X" * how_many_tens
      end
      #adding ones
      if how_many_ones == 9
      	      output << 'IX'
      	elsif how_many_ones >= 5 
      	      output << 'V' + 'I' * (how_many_ones - 5)
            elsif  how_many_ones == 4
                  output << 'IV'
            else
                  output << "I" * how_many_ones
      end

      output

end

# Drive code... this should print out trues.

puts to_roman(1) == "I"
puts to_roman(3) == "III"
puts to_roman(6) == "VI"

# TODO: what other cases could you add to ensure your to_roman method is working?