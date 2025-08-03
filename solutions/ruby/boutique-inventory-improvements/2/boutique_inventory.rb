class BoutiqueInventory
  attr_reader :items

  def initialize(items)
    @items = items.map{OpenStruct.new(_1)}
  end

  def item_names
    items.map(&:name).sort
  end

  def total_stock
    items.map(&:quantity_by_size).map(&:values).sum(&:sum)
  end
end
