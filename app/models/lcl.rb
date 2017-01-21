class Lcl < ActiveRecord::Base

  validates :shipper, :recipient, :description, :dest_lat, :dest_long, presence: true
end
