class Container < ActiveRecord::Base
  has_many :lcls
  has_many :consignees, through: :lcls
  validates :container_number, presence: true, uniqueness: true
end
