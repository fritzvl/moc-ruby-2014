require 'socket'


start_time = Time.now

1000.times do

  socket = TCPSocket.new('localhost', 1234)
  socket.puts "request:#{Time.now}\n"
  while result = socket.gets
    puts result
    break if result[-1]=="\n"
  end
  socket.close


end
puts "Time: #{(Time.now-start_time).to_i}"
