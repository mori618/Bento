class BentoBox < ApplicationRecord
  has_many :bento_box_dishes
  has_many :dishes ,through: :bento_box_dishes
  has_many :carts
  has_many :order_details
  belongs_to :genre, foreign_key: 'genre_id'
  has_one_attached :bento_image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  before_create :default_image

  def default_image
    if !self.bento_image.attached?
      self.bento_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'noimage.jpg')), filename: 'noimage.jpg', content_type: 'image/jpg')
    end
  end
end
