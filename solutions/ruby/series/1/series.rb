class Series
  def initialize(str)
    raise ArgumentError if str.empty?
    @str = str
  end

  def slices(n)
    if n<1 or (n > @str.length)
      raise ArgumentError
    end
    res = []
    for i in 0 .. @str.length-n
      res<<@str[i..i+n-1]
    end
    res
  end
end
