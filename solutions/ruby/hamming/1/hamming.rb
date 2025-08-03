module Hamming
  def self.compute(str1,str2)
    raise ArgumentError if str1.length != str2.length
    dist = 0
    for i in (0..str1.length - 1)
      dist += 1 if str1[i] != str2[i]
    end
    dist
  end
end
