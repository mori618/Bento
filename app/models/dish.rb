class Dish < ApplicationRecord

  has_many :bento_box_dishes
  has_many :bento_boxes, through: :bento_box_dishes

  has_one_attached :dish_image
end
