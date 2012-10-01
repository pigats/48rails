require 'open-uri'
require 'nokogiri'

class Ninja < ActiveRecord::Base
  attr_accessible :clan_id, :desc, :fb, :name, :tw, :in, :x, :y
  belongs_to :clan
 
  def profile_image_url
    Rails.cache.fetch("profile_image_url_#{self.id}", :expires_in => 0.hours) do
      if !self.in.blank?
        Nokogiri::HTML(open(self.in)).css('#profile-picture > img')[0]['src']
      elsif !self.fb.blank?
        Koala::Facebook::API.new.get_picture(self.fb)
      elsif !self.tw.blank?
        Twitter.user(self.tw).profile_image_url()
      end
    end
  end
  
end
