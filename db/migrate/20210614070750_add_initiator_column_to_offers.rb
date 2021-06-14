class AddInitiatorColumnToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :initiator, :boolean
  end
end
