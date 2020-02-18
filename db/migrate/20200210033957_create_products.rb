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
      t.integer :shipping_burden
      t.integer :shipping_date
      t.timestamps
    end
  end
end
