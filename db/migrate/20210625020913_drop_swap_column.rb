class DropSwapColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :swaps, :reserved
  end
end
