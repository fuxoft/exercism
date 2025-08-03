class SumOfMultiples
  def initialize(*divs)
    @divs = divs
  end
  def to(upto)
    mults = Set.new
    @divs.each do |div|
      if div == 0 then
        0
      else
        (div...upto).step(div) {mults << _1}
      end
    end
    mults.sum
  end
end