class Squares
  def initialize(n)
    @num = n
  end

  def square_of_sum
    (1..@num).sum**2
  end

  def sum_of_squares
    (1..@num).map{_1**2}.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
