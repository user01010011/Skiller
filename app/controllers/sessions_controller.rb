class SessionsController < ApplicationController

    def welcome 
    end

    def new 
    end

    def create 
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            flash[:error] = "Sorry, your login infor was incorrect. Please try again."
            redirect_to login_path
        end
    end 

    def omniauth
        @user = User.from_omniauth(auth)
        if @user.valid?
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            flash[:error] = "Invalid credentials"
            redirect_to login_path
        end
    end

    # def github
    #     @user = User.find_or_create_by(username: auth["info"]["name"]) do |user| 
    #         @user.password = SecureRandom.hex(16)
    #     end 
    #     if @user && @user.id 
    #         session[:user_id] = @user.id 
    #         redirect_to user_path(@user) 
    #     else 
    #         flash[:error] = "Invalid credentials"
    #         redirect_to login_path
    #     end
    # end


    def destroy
        session.clear 
        redirect_to '/'
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
    end

    def auth 
        request.env['omniauth.auth']
    end

end
