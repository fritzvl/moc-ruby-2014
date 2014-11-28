#Ruby and RubyOnRails course examples by masterofcode.com
#Copyright (C) 2014  Masterofcode LLC

class Foo

  attr_accessor :bar

  def initialize(value)
    self.bar=value
  end

  def change
    self.bar+=1
  end


end

foo = Foo.new(1)
bar=foo
foo.change

puts "Variables as a reference Ex.2"
puts "==================================================================="
puts bar.inspect
puts