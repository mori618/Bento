class AddDeliveryTimeToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :delivery_time, :datetime
  end
end
