class CreateSwaps < ActiveRecord::Migration[6.1]
  def change
    create_table :swaps do |t|
      t.string :module_code
      t.string :type
      t.string :current_slot
      t.string :desired_slots, array: true, default: []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
