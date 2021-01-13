class Triangle
  attr_accessor :length_1, :length_2, :length_3

  def initialize(length_1, length_2, length_3)
    @length_1 = length_1
    @length_2 = length_2
    @length_3 = length_3
  end

  def kind

    tri_ineq_one = (@length_1 + @length_2) > @length_3
    tri_ineq_two = (@length_2 + @length_3) > @length_1
    tri_ineq_three = (@length_1 + @length_3) > @length_2

    triangle_inequality = tri_ineq_one && tri_ineq_two && tri_ineq_three
    legal_lengths = (@length_1 > 0) && (@length_2 > 0) && (@length_3 > 0)

    one_two_eq = (@length_1 == @length_2) && (@length_2 != @length_3)
    two_three_eq = (@length_2 == @length_3) && (@length_2 != @length_1)
    one_three_eq = (@length_1 == @length_3) && (@length_1 != @length_2)

    if triangle_inequality && legal_lengths 
      if (@length_1 == @length_2) && (@length_2 == @length_3) && (@length_1 = @length_3)
        :equilateral
      elsif one_two_eq || two_three_eq || one_three_eq
        :isosceles
      elsif (@length_1 != @length_2) && (@length_2 != @length_3) && (@length_1 != @length_3)
        :scalene
      end
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError

  end
end
