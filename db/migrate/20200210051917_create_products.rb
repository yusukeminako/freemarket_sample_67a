class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user
      t.string :name                    #商品名
      t.text :condition                 #商品の状態
      t.text :description               #商品の説明文 
      t.integer :category_id            #カテゴリー referencesでは？
      t.references :brand               #ブランド
      t.integer :price                  #価格
      t.integer :buyer_id               #購入者？referencesでは？
      t.integer :size                   #サイズ
      t.timestamps
    end
  end
end