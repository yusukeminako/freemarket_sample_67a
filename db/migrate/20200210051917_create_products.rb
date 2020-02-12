class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user_id
      t.string :name
      t.text :condition
      t.text :description
      t.integer :category_id
      t.references :brand
      t.integer :price
      t.integer :buyer_id
      t.integer :size
      t.timestamps
    end
  end
end