module PythagoreanTriplet
  def self.triplets_with_sum(sum)
    triplets = []
    (1..sum/3).each do |a|
      b = (sum * (sum - 2 * a)) / (2 * (sum - a))
      c = sum - a - b
      break if b < a || c < b
      triplets << [a, b, c] if (a**2 + b**2 == c**2)
    end
    triplets
  end
end