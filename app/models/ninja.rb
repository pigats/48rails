require 'open-uri'

class Ninja < ActiveRecord::Base
  attr_accessible :clan_id, :desc, :fb, :name, :tw, :in
  belongs_to :clan
  
  def profile_image_url
    Rails.cache.fetch("profile_image_url_#{self.id}", :expires_in => 0.hours) do
      Nokogiri::HTML(open(self.in)).css('#profile-picture > img')[0]['src'] unless self.in.blank?
    end
    
    #if !self.fb.empty?
    #  Koala::Facebook::API.new.get_picture(self.fb)
    #elsif !self.tw.empty?
    #  Twitter.user(self.tw).profile_image_url()
    #end
  end
  
end
