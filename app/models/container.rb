class Container < ActiveRecord::Base
  has_many :lcls
  has_many :shippers, through: :lcls
  validates :container_number, presence: true, uniqueness: true
end
