class ResistorColorTrio
  COLORS = %w(black brown red orange yellow green blue violet grey white)
  
  def initialize(arr)
    @arr = arr
  end

  def color_to_int(color)
    COLORS.index(color)
  end
  
  def label
    num = (10*color_to_int(@arr[0]) + color_to_int(@arr[1])) * 10 ** color_to_int(@arr[2])
    div, mod = num.divmod(1000)
    valstr =
      if div >= 1 and mod == 0
        "#{div} kiloohms"
      else
        "#{num} ohms"
      end
    "Resistor value: #{valstr}"      
  end
end
