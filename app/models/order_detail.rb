class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :bento_box
  has_many :order_making_times
  attribute :making_status, :integer, default: 0

  enum making_status: {
    waiting: 0,
    in_progress: 1,
    completed: 2
  }
  
  def subtotal
    bento_box.price * amount
  end
end
