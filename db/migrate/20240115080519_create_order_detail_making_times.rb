class CreateOrderDetailMakingTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :order_detail_making_times do |t|
      t.integer :order_detail_id
      t.datetime :start_at
      t.datetime :end_at
      t.datetime :shipping_start_at
      t.datetime :shipping_end_at

      t.timestamps
    end
  end
end
