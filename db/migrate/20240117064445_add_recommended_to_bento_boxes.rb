class AddRecommendedToBentoBoxes < ActiveRecord::Migration[6.1]
  def change
    add_column :bento_boxes, :recommended, :boolean, default: false
  end
end
