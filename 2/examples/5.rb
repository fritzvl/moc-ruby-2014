# Class as value
mary = class Cow

  def moo
    puts "Moo as a cow"
  end

  self
end

z= mary.new

puts "Class by value"
puts "==================================================================="
z.moo
puts