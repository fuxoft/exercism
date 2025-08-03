class Triangle
  def initialize(sides)
    @a,@b,@c = *sides
  end

  def sides_ok?
    @a>0 && @b>0 && @c>0 && @a+@b>=@c && @a+@c>=@b && @b+@c>=@a
  end
  
  def equilateral?
    return false unless sides_ok?
    @a == @b && @b == @c
  end

  def isosceles?
    return false unless sides_ok?
    @a == @b || @b == @c || @a == @c
  end
  
  def scalene?
    return false unless sides_ok?
    @a!=@b && @b!=@c && @a!=@c
  end
end