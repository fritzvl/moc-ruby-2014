a = Fiber.new do
  i=1
  puts i
  Fiber.yield i
  i+=1
  puts i
  Fiber.yield
  i+=1
  puts i
  Fiber.yield
end

a.resume
a.resume
a.resume