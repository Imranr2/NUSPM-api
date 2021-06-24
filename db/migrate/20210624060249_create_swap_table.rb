class CreateSwapTable < ActiveRecord::Migration[6.1]
  def change
    create_table :swaps do |t|
      t.string :module_code
      t.string :type
      t.string :current_slot
      t.boolean :completed
      t.boolean :reserved
      t.string :venue
      t.string :startTime
      t.string :endTime
      t.string :day
      
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
