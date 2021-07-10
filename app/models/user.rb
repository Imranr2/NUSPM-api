class User < ApplicationRecord
    has_secure_password
    has_many :swaps, dependent: :destroy
    
    has_many :initiator_user_offers, class_name: 'Offer', foreign_key: 'initiator_user_id', dependent: :destroy
    has_many :creator_user_offers, class_name: 'Offer', foreign_key: 'creator_user_id', dependent: :destroy

    has_many :notifications, dependent: :destroy

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 

    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false,
        message: -> (object, data) do
            "#{data[:value]} exists. Please login instead."
        end
    }
    validates :password, length: { minimum:8 }
    validates :password_confirmation, presence: true, length: { minimum:8 }, on: :create, on: :update 
end
