class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user
      t.string :name
      t.text :condition
      t.text :description
      t.references :category
      t.references :brand
      t.integer :price
      t.references :buyer
      t.integer :size
      t.references :prefecture
      t.string :shipping_burden  #integer → string
      t.string :shipping_date  #integer → string
      t.timestamps
    end
  end
end
