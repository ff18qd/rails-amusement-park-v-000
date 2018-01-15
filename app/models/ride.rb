class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction
  
  def take_ride
    #   binding.pry
      
      user = User.find(self.user_id)
      attraction = Attraction.find(self.attraction_id)
      if user.tickets > attraction.tickets &&  user.height > attraction.min_height
          current_tickets =  user.tickets - attraction.tickets
          current_nausea =  user.nausea + attraction.nausea_rating
          current_happiness =  user.happiness + attraction.happiness_rating
          user.update(tickets: current_tickets, nausea: current_nausea, happiness: current_happiness)
            
      elsif  user.height < attraction.min_height && user.tickets < attraction.tickets
        return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        
      elsif  user.height < attraction.min_height && user.tickets > attraction.tickets
        return "Sorry. You are not tall enough to ride the #{attraction.name}."
        
      elsif user.height > attraction.min_height && user.tickets < attraction.tickets
          return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
      end 
          
  end 
end


