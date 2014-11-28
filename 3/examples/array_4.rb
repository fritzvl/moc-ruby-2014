#Ruby and RubyOnRails course examples by masterofcode.com
#Copyright (C) 2014  Masterofcode LLC

@test_array = [1, 2, 3, 4, 5, "b", "c", "d"]
puts "Get array info"
puts @test_array.join ","
puts "==================================================================="
puts "Length: #{@test_array.length}"
puts "Empty?: #{@test_array.empty?}"
puts "Include?: #{@test_array.include?(1)}"
puts

puts "Iterating over Array"
puts @test_array.join ","
puts "==================================================================="

puts "Iterate with each"
@test_array.each {|item| puts "Element : #{item}"}

puts "Iterate with reverse_each"
@test_array.reverse_each {|item| puts "Element : #{item}"}

puts "Iterate with indexes"
@test_array.each_index {|item| puts "Index : #{item}"}

puts "Map operation on array"
puts (@test_array.map {|item| if item.to_s!= "b";then item;end}).join ","


puts "Select operation on array"
puts (@test_array.select {|item| item !="b"}).join ","