# What is block?
def bar(a=5, &block)

  puts a
  yield
  puts "Block is :#{block.class}"

end

puts "What is block?"
puts "==================================================================="
bar { puts "Im a block!" }
