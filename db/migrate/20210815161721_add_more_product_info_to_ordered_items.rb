class AddMoreProductInfoToOrderedItems < ActiveRecord::Migration[6.1]
  def change
    add_column :ordered_items, :product_price, :decimal, precision: 10, scale: 2
    add_column :ordered_items, :subtotal, :decimal, precision: 10, scale: 2
  end
end
