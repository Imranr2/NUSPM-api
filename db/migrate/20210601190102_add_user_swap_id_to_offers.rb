class AddUserSwapIdToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :user_swap_id, :integer
  end
end
