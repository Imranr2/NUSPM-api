class RenameOfferColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :offers, :initiator, :initiated
  end
end
