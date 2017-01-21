class Container < ActiveRecord::Base

  validates :container_number, presence: true, uniqueness: true
end
