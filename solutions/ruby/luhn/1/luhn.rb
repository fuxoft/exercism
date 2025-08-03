module Luhn
  def self.valid?(str)
    str = str.delete(' ')
    return false if str.length <= 1
    return false if str.chars.any?{not _1.between?("0","9")}
    digits = str.to_i.digits
    (1..digits.length-1).step(2) do |i|
      if digits[i] <= 4
        digits[i] *= 2
      else
        digits[i] = digits[i]*2-9
      end
    end
    return digits.sum % 10 == 0
  end
end
