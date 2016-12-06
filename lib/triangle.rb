require 'pry'

class Triangle
  attr_reader :sides, :equilateral, :isoceles, :scalene

  def initialize(a,b,c)
    @sides = [a,b,c].sort
    # binding.pry
    if sides.length < 3
      raise TriangleError
    elsif sides.any? {|side| side <= 0}
      raise TriangleError
    elsif (sides[2] >= (sides[0] + sides[1]))
      raise TriangleError
    end
  end

  def kind
    if sides[0] == sides[2]
      :equilateral
    elsif sides[0] == sides[1] || sides[1] == sides[2]
      :isosceles
    else
      :scalene
    end
  end

end

class TriangleError < StandardError
  def message
    'meow meow'
  end

  # def no_size
  #   'Side lengths must be greater than 0, meow meow'
  # end
end
