#Ruby and RubyOnRails course examples by masterofcode.com
#Copyright (C) 2014  Masterofcode LLC

# Class as dynamically created object
dolly = Class.new(Object) do

  def moo
    puts "Moo as an artificial cow"
  end

end
x= dolly.new

puts "Class as dynamic object"
puts "==================================================================="
x.moo
puts x.class
puts dolly.class
puts