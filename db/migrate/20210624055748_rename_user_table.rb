class RenameUserTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_tables, :users
  end
end
