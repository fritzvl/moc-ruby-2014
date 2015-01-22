require 'thread'
require 'socket'

threads = []

start_time = Time.now.to_f

500.times do |thread_count|

  threads << Thread.new do
    socket = TCPSocket.new('localhost', 1234)
    socket.puts "request from #{thread_count}:#{Time.now}\n"
    while result = socket.gets
      puts result
      break if result[-1]=="\n"
    end
  end
end
threads.each(&:join)
puts "Time: #{(Time.now.to_f-start_time).to_i}"

puts "---"



