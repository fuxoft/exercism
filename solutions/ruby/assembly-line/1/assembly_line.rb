class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    221.0 * @speed * (if @speed == 10
        0.77
      elsif @speed == 9
        0.8
      elsif @speed >=5
        0.9
      else
       1.0
    end)
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
