class UpdateOrderedItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :ordered_items, :type, :dining_option
  end
end
