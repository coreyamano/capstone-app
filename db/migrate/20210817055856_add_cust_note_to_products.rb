class AddCustNoteToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :customer_note, :string
  end
end
