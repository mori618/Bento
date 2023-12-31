class Dish < ApplicationRecord

  has_many :bento_box_dishes
  has_many :bento_boxes, through: :bento_box_dishes
  belongs_to :genre_dish, foreign_key: 'genre_id'

  has_one_attached :dish_image

  validates :name, presence: true
  validates :introduction, presence: true

  before_create :default_image

  def default_image
    if !self.dish_image.attached?
      self.dish_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'noimage.jpg')), filename: 'noimage.jpg', content_type: 'image/jpg')
    end
  end
end
