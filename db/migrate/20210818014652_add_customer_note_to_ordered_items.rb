class AddCustomerNoteToOrderedItems < ActiveRecord::Migration[6.1]
  def change
    add_column :ordered_items, :customer_note, :string
  end
end
