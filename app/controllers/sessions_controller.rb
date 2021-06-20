class SessionsController < ApplicationController

    def welcome 
    end

    def new 
    end

    def create 
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id 
            redirect_to user_path(@user)
        else 
            redirect_to login_path
        end

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
