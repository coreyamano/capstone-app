class AddToOrdereItemsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :ordered_items, :product_item_name, :string
    add_column :ordered_items, :product_menu_category, :string
  end
end
