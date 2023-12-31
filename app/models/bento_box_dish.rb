class BentoBoxDish < ApplicationRecord
  belongs_to :bento_box
  belongs_to :dish
end
