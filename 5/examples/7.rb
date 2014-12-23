# Example of Proc objects preserving local context

def counter
  n = 0
  return Proc.new { n+= 1 }
end

a = counter
p a.call            # returns 1
p a.call            # returns 2

b = counter
p b.call            # returns 1

p a.call            # returns 3
