require 'thread'
mutex = Mutex.new

count1 = count2 = 0
difference = 0
counter = Thread.new do
  loop do
    mutex.synchronize do
      count1 += 1
      count2 += 1
    end
  end
end
spy = Thread.new do
  loop do
    mutex.synchronize do
      difference += (count1 - count2).abs
    end
  end
end
sleep 1
mutex.lock
puts "count1 :  #{count1}"
puts "count2 :  #{count2}"
puts "difference : #{difference}"