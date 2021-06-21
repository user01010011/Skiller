class Course < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  validates :course_name, uniqueness: true, presence: true 
  validates :course_desciption, presence: true 
  validates :institution, presence: true 
  validates :teacher, presence: true
  validates :importance, presence: true
  validates :progress, presence: true
  validates :course_url, presence: true 

  scope :order_by_importance, -> {order(importance: :asc)}
  scope :current_courses, -> {where(progress="In Progress")}

  def self.search(search)
    if search
       where(["course_name LIKE ?","%#{search}%"])
    else
        Course.all.order_by_name
    end
  end

end
