class Ninja < ActiveRecord::Base
  attr_accessible :clan_id, :desc, :fb, :name, :surname, :tw
  belongs_to :clan
  
  def profile_image_url
    if !self.fb.empty?
      Koala::Facebook::API.new.get_picture(self.fb)
    elsif !self.tw.empty?
      Twitter.user(self.tw).profile_image_url()
    end
  end
  
end
