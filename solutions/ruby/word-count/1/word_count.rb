class Phrase
  def initialize(str)
    @str = str
  end
  def word_count
    res = Hash.new(0)
    @str.scan(/\b([\w']+\b)/i).flatten.each do |wrd|
      res[wrd.downcase] += 1
    end
    res
  end
end