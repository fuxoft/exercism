module ArmstrongNumbers
  def self.include?(n)
    digits = n.digits
    n == digits.map{_1**digits.length}.sum
  end
end
