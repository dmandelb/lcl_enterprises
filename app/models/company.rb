class Company < ActiveRecord::Base

  validates :name, :phone, :email, presence: true
  validates :name, uniqueness: true
end
