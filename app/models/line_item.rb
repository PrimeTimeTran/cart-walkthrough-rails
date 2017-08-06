class LineItem < ApplicationRecord
  belongs_to :food_item
  belongs_to :cart
  delegate :price, to: :food_item
  delegate :name, to: :food_item

  def self.total
    10_000
  end

  def quantity_price
    self.quantity * self.price
  end
end
