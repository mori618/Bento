class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :bento_box

  validates :amount, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  def subtotal
    bento_box.price * amount
  end
end
