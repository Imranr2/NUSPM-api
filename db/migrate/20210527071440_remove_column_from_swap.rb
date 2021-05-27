class RemoveColumnFromSwap < ActiveRecord::Migration[6.1]
  def change
    remove_column :swaps, :desired_slots
  end
end
