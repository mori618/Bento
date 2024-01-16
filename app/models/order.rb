class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  has_one :order_making_time
  attribute :status, :integer, default: 0

  enum status: {
    waiting_production: 0,
    in_production: 1,
    waiting_delivery: 2,
    delivering: 3,
    delivered: 4
   }


  def address_display
  '〒' + post_code.to_s + ' ' + address + ' ' + name
  end

  def subtotal
    item.with_tax_price * amount
  end

end
