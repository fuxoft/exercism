module Reverser
  def self.reverse(str)
    len = str.length - 1
    for i in 0..len/2
      str[i], str[len-i] = str[len-i], str[i]
    end
    str
  end
end
