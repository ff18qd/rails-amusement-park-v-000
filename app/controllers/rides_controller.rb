class RidesController < ApplicationController

    def create
        # binding.pry
        
        @ride = Ride.create(user_id: session[:user_id], attraction_id: params[:attraction_id])
        @message = @ride.take_ride
        redirect_to user_path(session[:user_id], message: @message)
    end 
end 