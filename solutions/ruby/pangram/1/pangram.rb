module Pangram
  def self.pangram?(str)
    letters = Set.new(?a..?z)
    str.chars.each{letters.delete(_1.downcase)}
    letters.empty?
  end
end
