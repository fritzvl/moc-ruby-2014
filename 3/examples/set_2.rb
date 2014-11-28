#Ruby and RubyOnRails course examples by masterofcode.com
#Copyright (C) 2014  Masterofcode LLC

require 'set'

a = Set.new({ a: 1, b: 2})
b = Set.new({ a: 1, b: 3})

puts "Intersection"
puts a.intersection(b).inspect


puts "a+b"
puts (a+b).inspect
puts "b+a"
puts (b+a).inspect
puts "a-b"
puts (a-b).inspect
puts "b-a"
puts (b-a).inspect

