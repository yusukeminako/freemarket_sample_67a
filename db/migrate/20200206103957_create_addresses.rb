class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :zip_code,null: false
      t.string :prefecture,null: false
      t.string :city, null: false
      t.string :address1, null: false
      t.string :address2, null: false
      t.integer :landline
      t.timestamps
    end
  end
end
