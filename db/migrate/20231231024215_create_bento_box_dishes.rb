class CreateBentoBoxDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :bento_box_dishes do |t|
      t.references :bento_box, foreign_key: true
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end
