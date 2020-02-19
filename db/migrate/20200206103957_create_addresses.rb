class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user,null: false
      t.integer :zip_code,null: false           #郵便番号
      t.string :prefecture,null: false          #都道府県
      t.string :city, null: false               #市区町村
      t.string :address1, null: false           #住所
      t.string :address2                        #番地
      t.integer :landline                       #固定電話
      t.timestamps
    end
  end
end
