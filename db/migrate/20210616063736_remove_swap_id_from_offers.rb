class RemoveSwapIdFromOffers < ActiveRecord::Migration[6.1]
  def change
    remove_column :offers, :initiator_swap_id
    remove_column :offers, :creator_swap_id
  end
end
