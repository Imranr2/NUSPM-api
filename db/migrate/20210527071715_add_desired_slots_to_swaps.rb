class AddDesiredSlotsToSwaps < ActiveRecord::Migration[6.1]
  def change
    add_column :swaps, :desired_slots, :string, array: true, default: []
  end
end
