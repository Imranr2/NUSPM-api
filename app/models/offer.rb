class Offer < ApplicationRecord
  belongs_to :user

  # check that user cannot send offer to himself
  validates :user_id, :initiator_swap_id, :creator_swap_id, presence: true
  validates :accepted, :pending, :rejected, inclusion: { in: [true, false] }
end
