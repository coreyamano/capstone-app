class CreateOrderedItems < ActiveRecord::Migration[6.1]
  def change
    create_table :ordered_items do |t|
      t.integer :product_id
      t.integer :quantity
      t.integer :user_id
      t.string :status
      t.integer :tab_id
      t.string :type
      t.integer :check_id

      t.timestamps
    end
  end
end
