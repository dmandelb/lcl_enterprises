class Consignee < ActiveRecord::Base
  # before_create :format_phone
  has_many :lcls
  has_many :containers, through: :lcls

  validates :name, :phone, :email, presence: true
  validates :name, uniqueness: true
  has_secure_password

  # def format_phone
    
  # end
end
