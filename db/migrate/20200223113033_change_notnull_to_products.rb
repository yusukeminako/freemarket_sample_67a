class ChangeNotnullToProducts < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column_null :products, :name, false
      change_column_null :products, :condition, false
      change_column_null :products, :description, false
      change_column_null :products, :category, false
      change_column_null :products, :price, false
      change_column_null :products, :prefecture, false
      change_column_null :products, :shipping_burden, false
      change_column_null :products, :shipping_date, false
    end
  
    def down
      change_column_null :products, :name, true
      change_column_null :products, :condition, true
      change_column_null :products, :description, true
      change_column_null :products, :category, true
      change_column_null :products, :price, true
      change_column_null :products, :prefecture, true
      change_column_null :products, :shipping_burden, true
      change_column_null :products, :shipping_date, true
    end
  end
end
