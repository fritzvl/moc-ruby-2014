class Fish

  attr_accessor :speed

end

Fish.class_eval do

  def time(distance)
    "#{distance/speed} seconds"
  end

end

Fish.instance_eval do

  def time(distance)
    "#{distance/speed} seconds"
  end


end

p Fish.time(500)