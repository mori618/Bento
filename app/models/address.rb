class Address < ApplicationRecord
  belongs_to :customer

  def address_display
  '〒' + post_code.to_s + ' ' + address + ' ' + name
  end
end
