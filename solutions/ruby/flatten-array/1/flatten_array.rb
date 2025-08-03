module FlattenArray
  def self.flatten(arr)
    arr.flatten.filter{_1}
  end
end