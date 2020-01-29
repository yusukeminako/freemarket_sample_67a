# freemarket_sample_67a DB設計

## users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday_aaaa_id|integer|null: false|
|birthday_bb_id|integer|null: false|
|birthday_cc_id|integer|null: false|
|phone_num|integer|null: false|
|authentication_num|integer|null: false|
|content|text||

### Association
has_one :address
has_one :card
has_many :items


## category
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
has_many :items
has_ancestry


## card
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|customer_id|references|null: false,foreign_key: true|　　#stringから変更
|card_id|references|foreign_key: true|                   #integerから変更

### Association
belongs_to :user


## Address
|Column|Type|Options|
|------|----|-------|
|zip_code|integer|null: false|
|user_id|references|null: false,foreign_key: true| 
|prefecture_id|references|null: false,foreign_key: true|        #stringから変更
|city|string|null: false|
|address1|string|
|address2|integer|

### Association
belongs_to :user



## Items
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|name|string|null: false|
|description|text||
|category_id|references|null: false,foreign_key: true|   #_idに変更
|condition|integer|null: false|
|size|integer|null: false|
|delivery_charge|integer|null:false|
|delivery_way|string|null:false|
|prefecture|integer|null: false|
|delivery_days|integer|null: false|
|price|integer|null:false|
|status|integer|null:false|   #enumを使用

### Association
belongs_to :user
belongs_to :category
belongs_to :brand



## Brand
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|list|integer||

### Association
has_many :items