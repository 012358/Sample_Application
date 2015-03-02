class Location < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode


#   http://railscasts.com/episodes/273-geocoder
# https://github.com/alexreisner/geocoder

end
