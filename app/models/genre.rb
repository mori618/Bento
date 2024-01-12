class Genre < ApplicationRecord
  has_many :bento_boxes
  validates :name, presence: true
end
