class CreateChecks < ActiveRecord::Migration[6.1]
  def change
    create_table :checks do |t|
      t.integer :user_id
      t.integer :tab_id
      t.string :status
      t.decimal :subtotal, precision: 10, scale: 2
      t.decimal :tax, precision: 10, scale: 2
      t.decimal :total, precision: 10, scale: 2
      t.decimal :tip, precision: 10, scale: 2
      t.decimal :adjusted_total, precision: 10, scale: 2
      t.string :payment_type

      t.timestamps
    end
  end
end
