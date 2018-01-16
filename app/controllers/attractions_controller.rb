class AttractionsController < ApplicationController
    
    def index
        @attractions = Attraction.all
    end 
    
    def show
        # binding.pry

        @attraction = Attraction.find(params[:id])
    end 
end 