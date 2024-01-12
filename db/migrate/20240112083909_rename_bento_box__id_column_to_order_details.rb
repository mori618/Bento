class RenameBentoBoxIdColumnToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    rename_column :order_details, :bento_box__id, :bento_box_id
  end
end
