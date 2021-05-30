class AddStateToSwap < ActiveRecord::Migration[6.1]
  def change
    add_column :swaps, :completed, :boolean
    add_column :swaps, :reserved, :boolean
  end
end
