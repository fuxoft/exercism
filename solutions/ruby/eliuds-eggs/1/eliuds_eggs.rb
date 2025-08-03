module EliudsEggs
  def self.egg_count(n)
    res = 0
    while n > 0
      res += n & 1
      n /= 2
    end
    res
  end
end