class CreateStars < ActiveRecord::Migration[6.1]
  def change
    create_table :stars do |t|
      t.float :star, null: false, default: 0
      t.references :customer, null: false, foreign_key: true
      t.references :bento_box, null: false, foreign_key: true

      t.timestamps
    end
  end
end
