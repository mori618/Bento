class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :bento_box

  def subtotal
    bento_box.price * amount
  end
end
