class FoodItem < ApplicationRecord
  mount_uploaders :main_image, FoodUploader
  
  belongs_to :section
  has_many :line_items, dependent: :destroy

  validates :name, :price, presence: true

  def fake_image_url
    "http://loremflickr.com/320/240/" + name.parameterize
  end

end
