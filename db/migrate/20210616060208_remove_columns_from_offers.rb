class RemoveColumnsFromOffers < ActiveRecord::Migration[6.1]
  def change
    remove_column :offers, :pending
    remove_column :offers, :initiated
    remove_column :offers, :rejected
  end
end
