#Ruby and RubyOnRails course examples by masterofcode.com
#Copyright (C) 2014  Masterofcode LLC


@test_array = [1, 2, 3, 4, 5, "b", "c", "d"]

puts "Access elements with slice"
puts @test_array.join ","
puts "==================================================================="
puts ".slice(0)"
puts @test_array.slice(0)
puts "slice(0,2)"
puts @test_array.slice(0, 2).join ","
puts "slice(0..2)"
puts @test_array.slice(0..2).join ","
puts "slice(-3)"
puts @test_array.slice(-3)
puts "slice(300)"
puts @test_array.slice(300).inspect
puts
