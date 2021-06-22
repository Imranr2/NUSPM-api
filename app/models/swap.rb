class Swap < ApplicationRecord
  belongs_to :user

  validates :slot_type, presence: true, uniqueness: {
    scope: [:user_id, :module_code]
  }

  validates :slot_type, :current_slot, :desired_slots, :venue, :startTime, :endTime, :day,:user_id, presence: true
  validates :completed, :reserved, inclusion: { in: [true, false] }
end
