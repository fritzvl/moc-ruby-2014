# Differences

puts "Proc vs lambda"
puts "==================================================================="
puts

# Return difference
puts "Return difference"
puts "==================================================================="

def baz(a=5, &block)
  puts "a = #{a}.Block is :#{block.class}. Lambda? #{block.lambda?}"
  yield
end

# Define lambda
c = -> { puts "Im a lambda with return!"; return }
baz &c

# Define proc
d = Proc.new { puts "Im a Proc"; return }


puts "=================================Error================================="

begin
  baz &d
rescue LocalJumpError => e
  puts "Error!!!"
  puts "==================================================================="
  puts e.message
  puts e.backtrace
  puts "==================================================================="
end




