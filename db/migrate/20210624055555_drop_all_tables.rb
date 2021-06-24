class DropAllTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :swaps
    drop_table :users
  end
end
