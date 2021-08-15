class FixUserPassword < ActiveRecord::Migration[6.1]
  def change
    def change
      rename_column :users, :password_digest, :password
    end
  end
end
