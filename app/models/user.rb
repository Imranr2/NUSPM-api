class User < ApplicationRecord
    has_secure_password
    has_many :swaps

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 

    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false,
        message: -> (object, data) do
            "#{data[:value]} exists. Please login instead."
        end
    }
    validates :password, length: { minimum:8 }
    validates :password_confirmation, presence: true, length: { minimum:8 }, on: :create, on: :update 
end
