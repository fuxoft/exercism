module CollatzConjecture
  def self.steps(n)
    raise ArgumentError if n <= 0
    n == 1 ? 0 : 1 + steps(n.even? ? n/2 : 3*n+1)
  end
end