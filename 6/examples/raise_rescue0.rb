def foo_method(arg)
  p arg
end


def catch_full
  begin
    foo_method

  rescue ArgumentError
    p "Argument error handled using full syntax"
    p "One more handling logic"
  else
    p "If no exception, but never goes here"
  ensure
    p "Mandatory logic in any case"
  end
  p "General logic"
end


def catch_short
  foo_method

rescue ArgumentError
  p "Argument error handled using short syntax"
  p "One more handling logic"
else
  p "If no exception, but never goes here"
ensure
  p "Mandatory logic in any case"
  p "Mandatory logic in any case"
end


def nothing_to_catch
  begin
    foo_method("Nothing")

  rescue ArgumentError
    p "Argument error handled using full syntax"
    p "One more handling logic"
  else
    p "Processing if no exception"
  ensure
    p "Mandatory logic in any case"
  end
  p "General logic"
end


puts "Full declaration"
catch_full
puts "============================================================================"

puts "Short syntax"
catch_short
puts "============================================================================"

puts "No Exceptions"
nothing_to_catch
puts "============================================================================"






