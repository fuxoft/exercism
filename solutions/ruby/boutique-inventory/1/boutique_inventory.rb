class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    @items.map{_1[:name]}.sort
  end

  def cheap
    @items.select{_1[:price] < 30}
  end

  def out_of_stock
    @items.select{_1[:quantity_by_size].empty?}
  end

  def stock_for_item(name)
    @items.find{_1[:name] == name}[:quantity_by_size]
  end

  def total_stock
    @items.map{_1[:quantity_by_size].values.sum}.sum
  end

  private
  attr_reader :items
end
