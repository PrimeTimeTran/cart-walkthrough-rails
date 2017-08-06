class Section < ApplicationRecord
  has_many :food_items

  validates :name, presence: true, uniqueness: true
end
