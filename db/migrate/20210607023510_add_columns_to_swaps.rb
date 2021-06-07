class AddColumnsToSwaps < ActiveRecord::Migration[6.1]
  def change
    add_column :swaps, :venue, :string
    add_column :swaps, :startTime, :string
    add_column :swaps, :endTime, :string
    add_column :swaps, :day, :string
  end
end
