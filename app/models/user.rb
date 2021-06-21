class User < ApplicationRecord
    has_secure_password 

    has_many :courses
    has_many :skills, through: :courses

    validates :first_name, presence: true 
    validates :last_name, presence: true 
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    validates :username, uniqueness: true, presence: true
    validates :password, presence: true

    accepts_nested_attributes_for :skills, :courses

    def auth 
        request.env['omniauth.auth']
    end

    def self.from_omniauth(auth)
        self.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |u|
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(10)
            # u.username = auth['info']['name']
        end
    end

    # def self.from_omniauth(auth)
    #     where(provider: github, uid: auth.uid).first_or_create do |u|
    #         u.email = auth.info.email
    #         u.password = SecureRandom.hex(10)
    #     end
    # end
    
end
