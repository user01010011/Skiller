class User < ApplicationRecord
    has_many :courses
    has_many :skills, through: :courses

    validates :first_name, presence: true 
    validates :last_name, presence: true 
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    validates :username, uniqueness: true, presence: true
    validates :password, presence: true

    def auth 
        request.env['omniauth.auth']
    end

    def self.from_omniauth(auth)
        self.find_or_create_by(provider: auth("provider"), uid: auth("uid")) do |u|
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
            u.username = auth['info']['first_name']
        end
    end
    
end
