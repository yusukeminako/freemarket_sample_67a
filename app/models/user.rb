class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :validatable, password_length: 7..128 
        #  :validatable, last_name_kana: /\A[ァ-ヶー－]+\z/
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to_active_hash :year
  belongs_to_active_hash :day
  belongs_to_active_hash :month
  
end
