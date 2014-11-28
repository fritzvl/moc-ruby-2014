#Ruby and RubyOnRails course examples by masterofcode.com
#Copyright (C) 2014  Masterofcode LLC

# Symbols
a=:foo
b=:foo

puts "Symbols"
puts "==================================================================="
puts a.object_id
puts b.object_id
puts
a="foo"
b="foo"
puts "Strings"
puts "==================================================================="
puts a.object_id
puts b.object_id
puts
a=1
b=1
puts "Integers"
puts "==================================================================="
puts a.object_id
puts b.object_id
puts
a=4611686018427387904
b=4611686018427387904
puts "Integers after Fixnum range"
puts "==================================================================="
puts a.object_id
puts b.object_id
puts
