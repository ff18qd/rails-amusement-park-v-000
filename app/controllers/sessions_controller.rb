class SessionsController < ApplicationController
    def new
        @user = User.new
        # binding.pry
    end
 
    def create
        # binding.pry
        # session[:user_id] = params[:id]
        
        user = User.find_by_name(params[:user][:name])
        if user.authenticate(params[:user][:password])
            
             session[:user_id] = user.id
             redirect_to user_path(user)
        else 
         redirect_to signin_path
        end
    end
        
    def destroy
        # binding.pry
        if session[:user_id]
          session.delete :user_id
        end 
         redirect_to root_path
    end 
end