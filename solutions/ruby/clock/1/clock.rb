class Clock
  def initialize(hour:0, minute:0)
    @mins = (hour * 60 + minute) % 1440
  end

  def to_s()
    format("%02d:%02d", @mins / 60, @mins % 60)
  end

  def minutes()
    @mins
  end

  def +(clk)
    self.class.new(minute: @mins + clk.minutes)
  end

  def -(clk)
    self.class.new(minute: @mins - clk.minutes)
  end

  def ==(clk)
    @mins == clk.minutes
  end
end
