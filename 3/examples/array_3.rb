puts "Access elements with fetch"
puts @test_array.join ","
puts "==================================================================="
puts ".fetch(0)"
puts @test_array.fetch(0)
puts
puts "fetch(300) with error and exception handling "

begin
  puts @test_array.fetch(300)
rescue IndexError=>e
  puts e.message
  puts e.backtrace
  puts "Exception class : #{e.class.superclass}"
ensure
  puts "Fetch finished"
end
puts

puts "fetch(300) with error and exception handling in any block of code"
def test_fetch
  puts @test_array.fetch(300)
rescue IndexError=>e
  puts e.message
  puts e.backtrace
  puts "Exception class : #{e.class.superclass}"
ensure
  puts "Fetch finished"
end

test_fetch
