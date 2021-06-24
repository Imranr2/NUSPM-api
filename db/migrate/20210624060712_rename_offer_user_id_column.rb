class RenameOfferUserIdColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :offers, :initiator_user_id_id, :initiator_user_id
    rename_column :offers, :creator_user_id_id, :creator_user_id
  end
end
