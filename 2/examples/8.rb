mary = class Cow

  def moo
    puts "Moo as a cow"
  end

  self
end

z= mary.new


# Class eigenclass access
class << mary

  def moo
    puts "Moo as a cow class, through the class eigenclass access"
  end

end

puts "Class object changes through the eigenclass(meta-class)"
puts "==================================================================="
z.moo
mary.moo
puts
