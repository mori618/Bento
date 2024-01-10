class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :bento_box

  def subtotal
    item.with_tax_price * amount
  end
end
