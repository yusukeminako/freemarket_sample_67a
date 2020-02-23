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


<!-- lgtm次第消します -->
<!-- 新規登録
.addd
= form_for(resource, as: resource_name, url: registration_path(resource_name)) do |fo|
  = render "devise/shared/error_messages", resource: resource
  .address
    = fo.text_field :zip_code, placeholder: '郵便番号'
  .address1
    = fo.text_field :prefecture, placeholder: '県'
  .address2
    = fo.text_field :city, placeholder: '市区町村'
  .address3
    = fo.text_field :address1, placeholder: '番地'
  .address4
    = fo.text_field :address2, placeholder: '部屋番号'
  .address5
    = fo.text_field :landline, placeholder: '固定電話'


パスワード
.field
      = f.label :password
      - if @minimum_password_length
        %em
          (#{@minimum_password_length} characters minimum)
      %br/
      = f.password_field :password, autocomplete: "new-password"
    .field
      = f.label :password_confirmation
      %br/
      = f.password_field :password_confirmation, autocomplete: "new-password" -->