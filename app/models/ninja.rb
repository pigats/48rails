class Ninja < ActiveRecord::Base
  attr_accessible :clan_id, :desc, :fb, :name, :tw, :img, :x, :y
  belongs_to :clan
 
  def profile_image_url
    Rails.cache.fetch("profile_image_url_#{self.id}", :expires_in => 0.hours) do
      if !self.img.blank?
        img
      elsif !self.fb.blank?
        Koala::Facebook::API.new.get_picture(self.fb)
      elsif !self.tw.blank?
        Twitter.user(self.tw).profile_image_url()
      end
    end
  end
  
end
