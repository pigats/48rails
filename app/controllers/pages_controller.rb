class PagesController < ApplicationController
  def index
  end
  
  def about
  end
  
  def participants
    fb = Koala::Facebook::API.new
    
    @participants = {}
    Clan.all.each do |clan|      
      
      @participants[clan] = clan.ninjas
    end
  
  end
  
  def sponsors
  end
end
