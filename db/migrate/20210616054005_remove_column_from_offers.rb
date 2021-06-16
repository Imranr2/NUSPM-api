class RemoveColumnFromOffers < ActiveRecord::Migration[6.1]
  def change
    remove_column :offers, :user_id
  end
end
