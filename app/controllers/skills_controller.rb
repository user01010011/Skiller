class SkillsController < ApplicationController
    before_action :set_skill, only: %i[ show edit update destroy]

    def index
        # @skills = Skill.all
        @skills = Skill.order_by_name
        if params[:search]
            @skills = Skill.search(params[:search])
        end
    end

    def show 
        @skill = Skill.find(params[:id])
    end

    def new 
        @skill = Skill.new 
    end

    def create 
        @skill = Skill.new(skill_params)
        if @skill.save
            redirect_to skill_path(@skill)
        else 
            render :new 
        end
    end 

    def edit 
        @skill = Skill.find(params[:id])
    end

    def update 
        if @skill.update(skill_params)
            redirect_to skill_path(@skill)
        else 
            render :edit 
        end
    end

    private

    def set_skill
        @skill = Skill.find(params[:id])
    end

    def skill_params 
        params.require(:skill).permit(:skill_name, :skill_type, :skill_description, :user_id, courses_attributes: [ :course_name, :course_description, :institution, :teacher, :importance, :progress, :course_url ])
    end

end
