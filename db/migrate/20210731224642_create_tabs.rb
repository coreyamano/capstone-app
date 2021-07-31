class CreateTabs < ActiveRecord::Migration[6.1]
  def change
    create_table :tabs do |t|
      t.string :tab_name

      t.timestamps
    end
  end
end
