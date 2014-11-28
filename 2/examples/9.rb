#Ruby and RubyOnRails course examples by masterofcode.com
#Copyright (C) 2014  Masterofcode LLC

# Class-eval method

mary = class Cow

  attr_accessor :var1

  def moo
    puts self.var1
    puts "Moo as a cow"
  end

  def self.moo
    puts "Moo as class"
  end


  self
end

z= Cow.new

mary.class_eval do

  #def moo
  #  puts "We can moo via class-eval"
  #end

end



puts "Class changes through the class_eval"
puts "==================================================================="
z.moo
puts


# Instance-eval method
mary.instance_eval do

 # def moo
 #   puts "Moo via instance_eval"
 # end

end

puts "Class instance changes through the instance_eval"
puts "==================================================================="
mary.moo
Cow.moo
puts


puts "---------------------------------------------------------------"
# Instance-eval method
z.instance_eval do

 # def moo
 #   puts "Moo via instance_eval"
 # end

  def moo2
    puts "Moo2"
  end

end



puts "------------------------------------------------------------"
puts z.var1
puts "------------------------------------------------------------"
z.var1=5
z.moo


