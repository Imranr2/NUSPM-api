class Offer < ApplicationRecord
  belongs_to :initiator_user, class_name: 'User'
  belongs_to :creator_user, class_name: 'User'

  belongs_to :initiator_swap, class_name: 'Swap'
  belongs_to :creator_swap, class_name: 'Swap'

  has_many :notifications, as: :notifiable

  # check that user cannot send offer to himself
  validates :initiator_swap_id, :creator_swap_id, :creator_user_id, presence: true
  validates :initiator_user_id, presence: true, uniqueness: {
    scope: [:creator_swap_id],
    message: "has previously initiated the swap"
  }
  validates :accepted, :pending, inclusion: { in: [true, false] }
end
