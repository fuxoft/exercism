class Anagram
  def initialize(str)
    @word = str.downcase
  end
  def match(words)
    words.filter{is_anagram?(_1)}
  end
  def is_anagram?(str)
    return false if str.downcase == @word
    letters = str.downcase.chars
    @word.chars.each do |chr|
      i = letters.find_index(chr)
      return false unless i
      letters.delete_at(i)
    end
    return letters.empty?
  end
end