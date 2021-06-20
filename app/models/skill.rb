class Skill < ApplicationRecord
    has_many :courses
    has_many :users, through: :courses

    validates :skill_name, uniqueness: true, presence: true 
    validates :skill_type, presence: true 
    validates :skill_description, presence: true 
end
