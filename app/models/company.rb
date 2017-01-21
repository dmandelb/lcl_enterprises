class Company < ActiveRecord::Base
  has_many :shipped_lcls, foreign_key: :shipper_id
  has_many :received_lcls, foreign_key: :recipient_id
  has_many :shipping_companies, through: :received_lcls, source: :shipper
  has_many :receiving_companies, through: :shipped_lcls, source: :recipient

  validates :name, :phone, :email, presence: true
  validates :name, uniqueness: true
end
