class Address < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :post_code, presence: true
  validates :address, presence: true

  def address_display
  '〒' + post_code.to_s + ' ' + address + ' ' + name
  end
end
