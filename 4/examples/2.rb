class Fish

  attr_accessor :speed

end

Fish.class_eval do

  def time(distance)
    "#{distance/speed} seconds"
  end

end

a = Fish.new
a.speed=5
puts a.time(500)
