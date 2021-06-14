class AddColumnsToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :pending, :boolean
    add_column :offers, :rejected, :boolean
  end
end
