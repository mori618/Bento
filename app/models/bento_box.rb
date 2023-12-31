class BentoBox < ApplicationRecord
  has_many :bento_box_dishes
  has_many :dishes ,through: :bento_box_dishes
  has_one_attached :bento_image
end
