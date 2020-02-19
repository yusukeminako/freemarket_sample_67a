class Product < ApplicationRecord
  validates :name,              presence: true, length: { maximum: 40 }
  validates :description,       presence: true, length: { maximum: 1000 }
  validates :price,             presence: true, inclusion: 300..9999999
  validates :shipping_burden,   presence: true
  validates :shipping_date,     presence: true
  validates :condition,         presence: true
  validates :user_id,           presence: true
  validates :category_id,       presence: true
  validates :prefecture_id,     presence: true


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
end