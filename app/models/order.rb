class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  attribute :status, :integer, default: 0

  enum status: {
    "製作中": 0,
    "製作完了": 1,
    "配送待ち": 2,
    "配送中": 3,
    "配送済": 4,
   }

  def address_display
  '〒' + post_code.to_s + ' ' + address + ' ' + name
  end

  def subtotal
    item.with_tax_price * amount
  end

end
