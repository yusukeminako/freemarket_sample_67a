class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :validatable, password_length: 7..128 
  extend ActiveHash::Associations::ActiveRecordExtensions do
  belongs_to_active_hash :year
  belongs_to_active_hash :day
  belongs_to_active_hash :month
  end
  
end
