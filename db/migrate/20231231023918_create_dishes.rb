class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :genre_id
      t.integer :price
      t.text :introduction
      t.boolean :is_active , null: false, default: true

      t.timestamps
    end
  end
end
