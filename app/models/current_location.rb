class CurrentLocation < ActiveRecord::Base

  belongs_to :user
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

end
