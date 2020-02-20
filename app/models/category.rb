class Category < ApplicationRecord
  has_ancestry
  has_many :product
  belongs_to :parent, class_name: :Category, optional: true
  has_many :children, class_name: :Category, foreign_key: :parent_id
end
