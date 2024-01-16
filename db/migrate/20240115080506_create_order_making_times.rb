class CreateOrderMakingTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :order_making_times do |t|
      t.integer :order_id
      t.datetime :start_at
      t.datetime :end_at
      t.datetime :shipping_start_at
      t.datetime :shipping_end_at

      t.timestamps
    end
  end
end
