# Arguments difference
puts "Arguments difference"
puts "==================================================================="

def qux(a=5, &block)
  yield a, a+1
end

# Define lambda with 2 arguments
e = ->(x, y) { puts "Sum from lambda is :#{x.to_i+y.to_i}" }

# Define proc with 2 arguments
f = Proc.new { |x, y| puts "Sum from proc is :#{x.to_i+y.to_i}" }

puts
puts "No missing arguments"
puts "==================================================================="
qux &e
qux &f

# Define proc with 3 arguments
f = Proc.new { |x, y, z| puts "Sum from proc is :#{x.to_i+y.to_i+z.to_i}" }

# Define lambda with 3 arguments
e = ->(x, y, z) { puts "Sum from lambda is :#{x.to_i+y.to_i+z.to_i}" }

puts
puts "1 missing argument"
puts "==================================================================="
qux &f
begin
  qux &e
rescue ArgumentError => e
  puts "Error!!!"
  puts "==================================================================="
  puts e.message
  puts e.backtrace
  puts "==================================================================="
end
