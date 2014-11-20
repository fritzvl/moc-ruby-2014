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
puts dolly.class
puts
