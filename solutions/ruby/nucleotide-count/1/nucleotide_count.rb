class Nucleotide
  def self.from_dna(str)
    raise ArgumentError if str =~ /[^GTCA]/
    self.new(str)
  end
  
  def initialize(str)
    @str = str
  end

  def count(letter)
    @str.count(letter)
  end

  def histogram
    Hash[%w(A T C G).map{|ltr| [ltr, count(ltr)]}]
  end
end