class Scrabble
  @@scores = {}

  def self.add(sc, letters)
    letters.each_char {@@scores[_1] = sc}
  end

  add(1, "aeioulnrst")
  add(2, "dg")
  add(3, "bcmp")
  add(4, "fhvwy")
  add(5, "k")
  add(8, "jx")
  add(10, "qz")

  def initialize (str)
    @str =  str
    debug @@scores[3]
  end
  
  def score()
    res = 0
    @str.each_char do |ch|
      res += @@scores[ch.downcase]
    end
    res
  end
end
