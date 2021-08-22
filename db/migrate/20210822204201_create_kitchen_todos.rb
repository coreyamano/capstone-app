class CreateKitchenTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :kitchen_todos do |t|
      t.integer :tab_id
      t.integer :product_id
      t.string :submitted_time
      t.string :product_item_name
      t.string :dining_option
      t.string :status
      t.timestamps
    end
  end
end
