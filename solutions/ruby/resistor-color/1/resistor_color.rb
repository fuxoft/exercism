module ResistorColor
  COLORS = %w(black brown red orange yellow green blue violet grey white)
  def self.color_code(str)
    COLORS.find_index(str)
  end
end

    