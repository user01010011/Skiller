class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]

    def index   
        @users = User.all  
    end

    def show
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user 
    end

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            render :new
        end
    end 

    def edit
    end

    private 

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
    end

end
