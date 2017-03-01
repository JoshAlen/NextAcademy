# generates a tic tac toe array with the right ratio of 'x' and 'o'
def generate_realistic_tic_tac_toe
  start_first = ["x", "o"].shuffle
  random = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffle
  x = random[0, 5]
  y = random[5, 4]
 
  map = []
  i = 0
  while i < 3 do
  	map << []
  	j = 0
  	while j < 3 do
  		map[i] << ""
  		j += 1
  	end
  	i += 1
  end

  hash = 
  {  
  	1 => map[0][0], 2 => map[0][1], 3 => map[0][2],
  	4 => map[1][0], 5 => map[1][1], 6 => map[1][2],
  	7 => map[2][0], 8 => map[2][1], 9 => map[2][2]
  }
  x.each do |num|
  	 hash[num] << start_first[0]
  end
  y.each do |num|
  	 hash[num] << start_first[1]
  end
  map
end

# turns the array of players into array of hashes

def convert_roster_format(roster)
  roster = [
  	["Number", "Name", "Position", "Points per Game"],
	{"Number" => 12, "Name" => "Joe Schmo", 
		"Position" => "Center", "Points per Game" => [14, 32, 7, 0, 23]},
	{"Number" => 9, "Name" => "Ms. Buckets", 
		"Position" => "Point Guard", "Points per Game" => [19, 0, 11, 22, 0]},
	{"Number" => 31, "Name" => "Harvey Kay", 
		"Position" => "Shooting Guard", "Points per Game" => [0, 30, 16, 0, 25]},
	{"Number" => 7, "Name" => "Sally Talls", 
		"Position" => "Power Forward", "Points per Game" => [18, 29, 26, 31, 19]},
    {"Number" => 22, "Name" => "MK DiBoux", 
    	"Position" => "Small Forward", "Points per Game" => [11, 0, 23, 17, 0] }
]
end

p generate_realistic_tic_tac_toe
