class Swap < ApplicationRecord
  belongs_to :user

  has_many :initiator_swap_offers, class_name: 'Offer', foreign_key: 'initiator_swap_id'
  has_many :creator_swap_offers, class_name: 'Offer', foreign_key: 'creator_swap_id'

  validates :slot_type, presence: true, uniqueness: {
    scope: [:user_id, :module_code]
  }

  validates :slot_type, :current_slot, :desired_slots, :venue, :startTime, :endTime, :day,:user_id, presence: true
  validates :completed, :reserved, inclusion: { in: [true, false] }
end
