class User < ApplicationRecord
    has_many :courses
    has_many :skills, through: :courses

    validates :first_name, presence: true 
    validates :last_name, presence: true 
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    validates :username, uniqueness: true, presence: true
    validates :password, presence: true
end
