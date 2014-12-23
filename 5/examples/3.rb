# Lambdas

def bar(a=5, &block)
  yield
  puts "a = #{a}.Block is :#{block.class}. Lambda? #{block.lambda?}"
end

puts "Lambda passed as block"
puts "==================================================================="

a = -> { puts "Im a lambda!" }
p "My class is #{a.class}"
bar &a
puts "-------------------------------------------------------------------"
#Procs
puts "Proc passed as block"
puts "==================================================================="
b = Proc.new { puts "Im a Proc" }
p "My class is #{b.class}"
bar &b