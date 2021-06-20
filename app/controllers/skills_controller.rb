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

    end 

    def edit 
        @skill = Skill.find(params[:id])
    end

    def update 
    
    end

    private

    def skill_params 
        params.require(:skill).permit(:skill_name, :skill_type, :skill_description)
    end

end
