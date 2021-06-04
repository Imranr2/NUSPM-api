class AddTargetSwapIdToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :target_swap_id, :integer
  end
end
