# This is how you define your own custom exception classes
class NoOrangesError < StandardError
end

class OrangeTree
  attr_accessor :height, :age

  MAX_AGE = 8
  FRUIT_BEARING_ARE = 2
  def initialize
    @age = 0
    @height = 0
    @num_of_oranges = 0
  end

  # Ages the tree one year
  def age!
    @age += 1
    @height += rand(0.3..0.5)
      if age > FRUIT_BEARING_ARE
      rand(10..30).times do 
        @num_of_oranges << Orange.new(rand(0.1..0.2))
      end
    end
  end

  def dead?
    @age >= MAX_AGE
  end

  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def any_oranges?
    @num_of_oranges > 0
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange!
    raise NoOrangesError, "This tree has no oranges" unless self.any_oranges?
    # orange-picking logic goes here
     return @num_of_oranges.pop
     
  end
 
end

class Orange
  attr_reader :diameter
  # Initializes a new Orange with diameter +diameter+
  def initialize(diameter = 0)
      @diameter = diameter
  end
end