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
|birthday_aaaa_id|integer|null: false|
|birthday_bb_id|integer|null: false|
|birthday_cc_id|integer|null: false|
|phone_num|string|null: false|
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
|user|references|null: false|
|customer_id|string||
|sub_sub|string||
|card_id|integer|string|

### Association
belongs_to :user


## Address
|Column|Type|Options|
|------|----|-------|
|zip_code1|string|null: false|
|user_id|string|null: false|
|prefecture_id|string|null: false|
|city|string|null: false|
|address1|string|
|address2|string|

### Association
belongs_to :user



## Items
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|name|string|null: false|
|description|text||
|category|references|null: false|
|condition|references|null: false|
|size|references|null: false|
|delivery_charge|integer|null:false|
|delivery_way||null:false|
|prefecture|references|null: false
|delivery_days|references|null: false|
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