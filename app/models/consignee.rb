class Consignee < ActiveRecord::Base
  has_many :lcls
  has_many :containers, through: :lcls

  validates :name, :phone, :email, presence: true
  validates :name, uniqueness: true
  has_secure_password
end
