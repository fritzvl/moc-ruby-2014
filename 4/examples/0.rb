module FunnyM

  def fun
    "hahaha"
  end

end

module SorrowM

  def sorrow
    "life is pain"
  end

end


class Person

  include FunnyM
  extend SorrowM

end


p Person.sorrow
p Person.new.fun