class Address < ApplicationRecord
  validates :zip_code,             presence: true,format: /\A\d{6,8}\z/
  validates :prefecture,           presence: true
  validates :city,                 presence: true
  validates :address1,             presence: true
  
  belongs_to :user, optional: true
end
