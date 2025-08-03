class Proverb
  def initialize(*words,**opt)
    @words = words
    @qualifier = opt[:qualifier]
  end
  def to_s
    lines = (0..@words.length-2).map do |i|
      "For want of a #{@words[i]} the #{@words[i+1]} was lost.\n"
    end
    lines.join + "And all for the want of a #{
      @qualifier ? @qualifier+" " : ""
    }#{@words.first}."
  end
end
