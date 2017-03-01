class Bicycle  
  attr_accessor :gears, :brakes, :wheels
  def initialize(gears = "regular", brakes = "regular", wheels = "regular")
    @gears = gears
    @brakes = brakes
    @wheels = wheels
  end
end

class MountainBike < Bicycle

  def initialize
    @brakes = "V-brakes"
  end

  def absorbe_bumps(bumps)
    @absorbe_bumps = bumps
  end

  def to_s
    puts "brakes is #{@brakes} and the bumps is #{@absorbe_bumps}"
  end
end

class RoadBike < Bicycle
  @brakes = "caliper brakes"
end

m_bikes = MountainBike.new
m_bikes.absorbe_bumps("crazy_bumps")
m_bikes.to_s