class Skill < ApplicationRecord
    has_many :courses
    has_many :users, through: :courses

    validates :skill_name, uniqueness: true, presence: true 
    validates :skill_type, presence: true 
    validates :skill_description, presence: true 

    accepts_nested_attributes_for :courses 

    scope :order_by_name, -> {order(skill_name: :asc)}
end
