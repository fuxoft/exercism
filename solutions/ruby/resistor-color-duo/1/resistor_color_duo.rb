module ResistorColorDuo
  def self.value(arr)
    colors = %w[black brown red orange yellow green blue violet grey white]
    10*colors.find_index(arr[0]) + colors.find_index(arr[1])
  end
end
