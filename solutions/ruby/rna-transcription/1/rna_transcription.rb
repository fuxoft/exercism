module Complement
  REPLACE = {'G'=>'C', 'C'=>'G', 'T'=>'A', 'A'=>'U'}
  def self.of_dna(str)
    str.chars.map{REPLACE[_1]}.join
  end
end

