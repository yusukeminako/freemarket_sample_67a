# freemarket_sample_67a DB設計

## users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email||null: false|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday_year_id|integer|null: false|
|birthday_month_id|integer|null: false|
|birthday_day_id|integer|null: false|
|phone_num|integer|null: false,unique: true|
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


## cards
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
belongs_to :user


## Address
|Column|Type|Options|
|------|----|-------|
|zip_code|integer|null: false|
|user|references|null: false,foreign_key: true| 
|prefecture|string|null: false|        
|city|string|null: false|
|address1|string|null: false|
|address2|string|
|landline|integer|

### Association
belongs_to :user



## Products
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|name|string|null: false|
|category|references|null: false,foreign_key: true|
|brand|references|null: false,foreign_key: true|  
|condition|text|null: false|
|size|integer|null: false|
|shipping_burden|string|null:false|
|shipping_date|string|null:false|
|prefecture|references|null: false,foreign_key: true|
|price|integer|null:false|
|buyer|references|null: false,foreign_key: true|   

### Association
belongs_to :user
belongs_to :category
belongs_to :brand
has_many :images



### Association
has_many :items



## Images
|Column|Type|Options|
|product|references|null: false,foreign_key:true|
|src|text|null: false|
<!-- srcはimgのこと -->

### Association
belongs_to :product