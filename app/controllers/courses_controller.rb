class CoursesController < ApplicationController
    before_action :set_course, only: %i[ show edit update destory ]

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

    def update
        if @course.update(course_params)
            redirect_to course_path(@course)
        else 
            render :edit
        end
    end

    private 

    def set_course 
        @course = Course.find(params[:id])
    end

    def course_params 
        params.require(:course).permit(:course_name, :course_description, :institution, :teacher, :importance, :progress, :course_url) 
    end

end
