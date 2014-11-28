#Ruby and RubyOnRails course examples by masterofcode.com
#Copyright (C) 2014  Masterofcode LLC


puts "Define by old syntax"
puts "==================================================================="
@test_hash={:key1=> "value1", :key2=> "value2" }
puts @test_hash.values.join ","
puts
puts "Define by new syntax"
puts "==================================================================="
@test_hash={key1: "value1", key2: "value2" }
puts @test_hash.values.join ","
puts
puts "Define from Array"
puts "==================================================================="
@test_hash=Hash["a", 1, "b", 2]
puts @test_hash.values.join ","
puts
puts "Custom key must have two mandatory methods to be implemented : eql? and hash"
puts "==================================================================="
#Example from  standard documentation of Ruby 2.0.0-p247

puts "Hashes comparsion"
puts "{ a: 1, b:2 } == { a: 1, b: 2}"
puts ({ a: 1, b:2 } == { a: 1, b: 2})
puts "{ a: 1, b:3 } == { a: 1, b: 2}"
puts ({ a: 1, b:3 } == { a: 1, b: 2})



