class RenameColumnOffers < ActiveRecord::Migration[6.1]
  def change
    rename_column :offers, :user_swap_id, :initiator_swap_id
    rename_column :offers, :target_swap_id, :creator_swap_id
  end
end
