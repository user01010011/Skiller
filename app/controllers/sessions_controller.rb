class SessionsController < ApplicationController

    def welcome 
    end

    def new 
    end

    def create 

    end 

    def destroy
        session.clear 
        redirect_to '/'
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
    end

end
