class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :item_name
      t.string :menu_category
      t.decimal :price, precision: 10, scale: 2
      t.boolean :availability
      t.string :image

      t.timestamps
    end
  end
end
