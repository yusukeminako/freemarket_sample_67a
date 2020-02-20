class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  validates :password,                presence: true, length: {minimum: 7, maximum: 128}
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  validates :nickname,                presence: true
  validates :last_name,               presence: true,format: /\A[一-龥ぁ-ん]/
  validates :first_name,              presence: true,format: /\A[一-龥ぁ-ん]/
  validates :last_name_kana,          presence: true,format: /\A[ァ-ヶー－]+\z/
  validates :first_name_kana,         presence: true,format: /\A[ァ-ヶー－]+\z/
  validates :phone_number, format: /\A\d{10,11}\z/
  validates :birthdate_year,              presence: true
  validates :birthdate_month,             presence: true
  validates :birthdate_day,               presence: true

         extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to_active_hash :year
  belongs_to_active_hash :day
  belongs_to_active_hash :month
  has_many :cards
  has_many :products
  has_one :address
end
