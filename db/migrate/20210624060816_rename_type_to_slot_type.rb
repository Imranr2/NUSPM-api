class RenameTypeToSlotType < ActiveRecord::Migration[6.1]
  def change
    rename_column :swaps, :type, :slot_type
  end
end
