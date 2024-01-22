class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :bento_box
  has_one :order_detail_making_time
  attribute :making_status, :integer, default: 0
  validates :price, presence: true
  validates :amount, presence: true

  enum making_status: {
    waiting: 0,
    in_progress: 1,
    completed: 2
  }

  def subtotal
    bento_box.price * amount
  end
end
