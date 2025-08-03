module Grains
  def self.square(sq)
    raise ArgumentError unless sq.between?(1,64)
    2**(sq-1)
  end
  def self.total
    2**64 - 1
  end
end
