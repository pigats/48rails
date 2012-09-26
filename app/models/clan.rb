class Clan < ActiveRecord::Base
  attr_accessible :ensign, :name
  has_many :ninjas

end
