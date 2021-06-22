class RenameRejectedToPendingOffers < ActiveRecord::Migration[6.1]
  def change
    rename_column :offers, :rejected, :pending
  end
end
