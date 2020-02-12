class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user
      t.string :name, null: false
      t.text :condition, null: false
      t.text :description, null: false
      t.references :category
      t.references :brandr
      t.references :price
      t.references :buyer
      t.integer :size
      t.references :prefecture, null: false
      t.integer :shipping_burden, null: false
      t.integer :shipping_date, null: false
      t.timestamps
    end
  end
end
