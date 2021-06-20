class SkillsController < ApplicationController

    def index
        @skills = Skill.all
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

    def skill_params 
        params.require(:skill).permit(:skill_name, :skill_type, :skill_description)
    end

end
