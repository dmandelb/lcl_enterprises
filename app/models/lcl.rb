class Lcl < ActiveRecord::Base
  belongs_to :container
  belongs_to :shipper, class_name: "Company"
  belongs_to :recipient, class_name: "Company"
  validates :shipper, :recipient, :description, :dest_lat, :dest_long, presence: true
end
