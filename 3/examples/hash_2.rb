#Ruby and RubyOnRails course examples by masterofcode.com
#Copyright (C) 2014  Masterofcode LLC

# Hash KEY requirements example
class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def ==(other)
    self.class === other and
        other.author == @author and
        other.title == @title
  end

#Mandatory method to be hash key
  alias eql? ==
  alias lalala ==
#Mandatory method to be hash key
  def hash
    @author.hash ^ @title.hash # XOR
  end

end



book1 = Book.new 'matz', 'Ruby in a Nutshell'
book2 = Book.new 'matz', 'Ruby in a Nutshell'

puts "Different objects"
puts "ObjectID :#{book1.object_id}"
puts "ObjectID :#{book2.object_id}"
puts
reviews = {}

reviews[book1] = 'Great reference!'
reviews[book2] = 'Nice and compact!'

puts "But the same key"
puts book1.hash
puts book2.hash
puts reviews.length