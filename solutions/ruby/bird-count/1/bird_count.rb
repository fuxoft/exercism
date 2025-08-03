class BirdCount
  def self.last_week
    [0,2,5,3,7,8,4]
  end

  def initialize(birds_per_day)
    @bpd = birds_per_day
  end

  def yesterday
    @bpd[-2]
  end

  def total
    @bpd.sum
  end

  def busy_days
    @bpd.count {|n| n >= 5}
  end

  def day_without_birds?
    @bpd.any? {|n| n == 0}
  end
end
