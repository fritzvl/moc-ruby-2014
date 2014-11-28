#Ruby and RubyOnRails course examples by masterofcode.com
#Copyright (C) 2014  Masterofcode LLC

mary = class Cow

  def moo
    puts "Moo as a cow"
  end

  def self.moo
    puts "Moo as class"
  end

  self
end

z= mary.new
mary.moo

# Class eigenclass access
class << mary

  def moo
    puts "Moo as a cow class, through the class eigenclass access"
  end

end

puts "Class object changes through the eigenclass(meta-class)"
puts "==================================================================="
z.moo
mary.moo
puts
puts "Z class is #{z.class}"

y= mary.new
puts "Y moo is:"
y.moo
