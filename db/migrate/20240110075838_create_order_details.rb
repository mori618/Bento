class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :bento_box__id
      t.integer :price
      t.integer :amount
      t.integer :making_status

      t.timestamps
    end
  end
end
