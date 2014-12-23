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

puts "=================================No error================================="


def some_method
  d = Proc.new { puts "Im a Proc"; return }
  baz &d
  p "Some method work"
end

some_method