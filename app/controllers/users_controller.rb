class UsersController < ApplicationController

    def index   
        @users = User.all  
    end

    def new 
        @user = User.new
    end

    def create 

    end 

    def edit 

    end

    def show
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user 
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
    end

end
