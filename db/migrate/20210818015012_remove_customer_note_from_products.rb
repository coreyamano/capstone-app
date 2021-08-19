class RemoveCustomerNoteFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :customer_note, :string
  end
end
