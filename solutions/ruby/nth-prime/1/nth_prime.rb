module Prime
  def self.nth(nth)
    raise ArgumentError if nth < 1
    fib = Fiber.new do
      Fiber.yield(2)
      n = 3
      while true
        if (2..Math.sqrt(n)).to_a.map{n%_1 != 0}.all?
          Fiber.yield n
        end
        n+=2
      end
    end
    for i in 1..nth
      result = fib.resume
    end
    result
  end
end
