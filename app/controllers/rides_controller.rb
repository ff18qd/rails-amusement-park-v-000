class RidesController < ApplicationController
    
    # def new
    #     binding.pry
    # end 
    
    def create
        # binding.pry
        
        @ride = Ride.create(user_id: session[:user_id], attraction_id: params[:attraction_id])
        @ride.take_ride
        redirect_to user_path(session[:user_id])
    end 
end 