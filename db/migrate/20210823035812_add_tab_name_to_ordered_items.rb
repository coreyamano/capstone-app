class AddTabNameToOrderedItems < ActiveRecord::Migration[6.1]
  def change
    add_column :ordered_items, :tab_name, :string
  end
end
