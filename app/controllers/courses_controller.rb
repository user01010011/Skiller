class CoursesController < ApplicationController

    def index
        @courses = Course.all 
    end

    def show 
        @course = Course.find(params[:id])
    end

    def new 
        @course = Course.new
    end

    def create 
        @course = Course.new(course_params)
        if @course.save
            redirect_to course_path(@course)
        else 
            render :new 
        end
    end 

    def edit 
        @course = Course.find(params[:id])
    end

    private 

    def course_params 
        params.require(:course).permit(:course_name, :course_description, :institution, :teacher, :importance, :progress, :course_url) 
    end

end
