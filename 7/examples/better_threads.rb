require 'thread'
require 'socket'

ssock = TCPServer.new(1234)
requests = Queue.new


Thread.start do
  while msg = requests.pop
    (msg[0] << "Your request was #{msg[1]}\n\r.Result is #{msg[1].upcase}\n\r").flush
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



