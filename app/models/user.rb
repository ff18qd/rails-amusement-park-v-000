class User < ActiveRecord::Base
  # write associations here
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  
  validates :name, presence: true
  validates :password, presence: true
  
  
  
  def mood 
      if self.nausea > self.happiness
          return 'sad'
      else 
          return 'happy'
      end 
      
  end 
end



