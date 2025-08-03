module Isogram
  def self.isogram?(str)
    dict = {}
    str.each_char{|ch0|
      ch = ch0.downcase
      if ch.between?('a','z')
        return false if dict[ch]
        dict[ch] = true
      end
    }
    true
  end
end