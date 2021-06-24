class CreateOfferTable < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.boolean :accepted
      t.boolean :pending

      t.timestamps
    end
  end
end
