class BoggleBoard
  def initialize(arr_type)
   empty = []
    i = 0
   while i < 4 do
    empty << []
    j = 0
      while j < 4 do
        empty[i] << ""
        j += 1
      end
    i += 1
    end

  @board = empty
  @new_board = []
  @row_one
  @row_two
  @row_three
  @row_four
  end

  def shake!
  @board = []
  dice = [
    ["A","A","E","E","G","N"],
    ["E","L","R","T","T","Y"],
    ["A","O","O","T","T","W"],
    ["A","B","B","J","O","O"],
    ["E","H","R","T","V","W"],
    ["C","I","M","O","T","U"],
    ["D","I","S","T","T","Y"],
    ["E","I","O","S","S","T"],
    ["D","E","L","R","V","Y"],
    ["A","C","H","O","P","S"],
    ["H","I","M","N","Q","U"],
    ["E","E","I","N","S","U"],
    ["E","E","G","H","N","W"],
    ["A","F","F","K","P","S"],
    ["H","L","N","N","R","Z"],
    ["D","E","I","L","R","X"]
  ]

  dice.each do |i|
    i.shuffle!
  end

  new_dices = []

  dice.each do |i|
    new_dices << i[0]
  end
  

  @new_board = new_dices
  @row_one = new_dices[0, 4]
  @row_two = new_dices[3, 4]
  @row_three = new_dices[7, 4]
  @row_four = new_dices[11, 4]

  @board << @row_one
  @board << @row_two
  @board << @row_three
  @board << @row_four

  end

  def include?(check)
    
    if (check.class == Array)
      check = check.join('')
    end
    arr_word = [] 
     arr_word << @row_one.join('') 
     arr_word << @row_two.join('') 
     arr_word << @row_three.join('') 
     arr_word << @row_four.join('') 
    i = 0
    word = ""
    while i < 4
      word << @row_one[i]
      word << @row_two[i]
      word << @row_three[i]
      word << @row_four[i]
      arr_word << word
      word = ""
      i = i + 1
    end
    p arr_word
    arr_word.each do |i|
      if i.include?(check)
        return true
      end
    end
    false
  end

  # Defining to_s on an object controls how the object is
  # represented as a string, e.g., when you pass it to puts
  
  # Override this to print out a sensible board format so
  # you can write code like:
  
  # board = BoggleBoard.new
  # board.shake!
  # puts board
  def to_s
    
  end
end

board = BoggleBoard.new

array = board.shake!

p board.include?("AB")

  
