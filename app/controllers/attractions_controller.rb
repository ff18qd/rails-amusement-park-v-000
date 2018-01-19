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
    
    def edit 
        # binding.pry
        @attraction = Attraction.find(params[:id])
    end 
    
    def update
        # binding.pry
        @attraction = Attraction.find(params[:id])
        @attraction.update(name: params[:attraction][:name]) 
        @attraction.update(min_height: params[:attraction][:min_height]) 
        @attraction.update(happiness_rating: params[:attraction][:happiness_rating]) 
        @attraction.update(nausea_rating: params[:attraction][:nausea_rating]) 
        @attraction.update(tickets: params[:attraction][:tickets]) 
        redirect_to attraction_path(@attraction)
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