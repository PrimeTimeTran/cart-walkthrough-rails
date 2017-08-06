class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def item_count
    line_items.count
  end

  def total
    line_items.reduce(0) {|sum, e| sum + e.quantity_price}
  end

  def consolidate_items(item)
    line_items.each do |i|
      if i.food_item_id == item[:food_item_id].to_i
        i.quantity += item[:quantity].to_i
        i.save
        return
      end
    end
    line_items.create item
  end
end
