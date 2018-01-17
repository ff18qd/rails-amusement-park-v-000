class UsersController < ApplicationController
    def new
        @user = User.new
    end 
    
    def create 
        @user = User.new(user_params) #user already exit or not
        if @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            redirect_to root_path
        end 
    end 
    
    
    def show 
        # binding.pry
        @user = User.find(params[:id])
        @message = params[:message] if params[:message]
        
        if session[:user_id] != @user.id
            redirect_to root_path
        end 
            
    end 
    
    private 
    
    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end
 
end 