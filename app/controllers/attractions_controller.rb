class AttractionsController < ApplicationController
    
    def new 
        @attraction = Attraction.new
    end 
    
    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
     
            
        end
    end 
    
    def index
        @attractions = Attraction.all
        @user = User.find(session[:user_id])
    end 
    
    def show
        # binding.pry

        @attraction = Attraction.find(params[:id])
    end 
    
     
    private 
    
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
    
end 