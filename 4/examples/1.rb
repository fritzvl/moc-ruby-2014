module MagicWords

  module ClassMethods

    def magic_methods(*magic_words)


      magic_words.each do |magic_word|

        define_method magic_word do


          "Real magic word #{magic_word}"



        end
      end
    end
  end

  #avoid extend and include
  def self.included(base)
    base.extend(ClassMethods)
  end

end

class LonelyClass

  include MagicWords

  magic_methods :test, :rest, :fest



end

p LonelyClass.new.test
p LonelyClass.new.rest
p LonelyClass.new.fest