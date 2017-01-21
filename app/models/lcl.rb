class Lcl < ActiveRecord::Base
  belongs_to :container
  belongs_to :consignee
  validates :consignee, :description, :dest_lat, :dest_long, presence: true
end
