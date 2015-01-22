require 'thread'
require 'socket'

ssock = TCPServer.new(1234)
requests = Queue.new
results = Queue.new

Thread.start do
  while msg = results.pop
    (msg[0] << "Your request was #{msg[1]}.Result is #{msg[2]}\n\r").flush

  end
end

Thread.start do
  while msg = requests.pop
    puts "Processing ....Requests:#{requests.size} Results:#{results.size}"
    results << [msg[0], msg[1], msg[1].upcase]
  end
end


loop do
  Thread.start(ssock.accept) do |sock|

    begin
      while line = sock.gets; # Returns nil on EOF.
        requests << [sock, line.chomp]
      end
    rescue
      bt = $!.backtrace * "\n  "
      ($stderr << "error: #{$!.inspect}\n  #{bt}\n").flush
    ensure
      sock.close
    end
  end
end



