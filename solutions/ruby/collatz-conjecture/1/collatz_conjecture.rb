module CollatzConjecture
  def self.steps(n)
    raise ArgumentError if n <= 0
    n == 1 ? 0 : 1 + (n%2 == 0 ? steps(n/2) : steps(3*n+1))
  end
end