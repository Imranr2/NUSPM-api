class AddRejectedToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :rejected, :boolean
  end
end
