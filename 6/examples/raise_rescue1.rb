def repeater(text, rep)
  raise ArgumentError.new("Rep must be positive Integer") unless rep.respond_to?(:to_i) && rep.to_i>0
  rep.to_i.times do
    p text
  end
end

repeater "Success", 5
repeater "Success 2", "5"

begin
  repeater "Fail", "a5"
rescue Exception => e
  puts "Expection handling started"
  p e.message
  p e.backtrace
  puts "Expection handled"
end

p "Application finished"
