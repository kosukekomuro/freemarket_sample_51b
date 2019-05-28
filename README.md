# README

# DB設計

## ER図
![ER図](https://gyazo.com/de2a518e4ab6f7dd5d88948cf0751c9d)

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false| 
|email|string|null: false, unique:true|
|password|string|null: false, unique:true|
|introduce|text||
|phone_number|int|unique:true|
|birthday|string| null:false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|string|null: false|
|prefecture_id|references|null: false, foreign_key: true|
|address|string|null: false|
|building_name|string||

### Association
- has_many :likes
- has_many :comments
- has_many :seller, class_name: ‘Product’, :foreign_key => ‘seller_id’
- has_many :buyer, class_name: ‘Product’, :foreign_key => ‘buyer_id’
- belongs_to :prefecture
- belongs_to :card

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true| 
|valid_month|string|null: false|
|valid_day|string|null: false|
|security_code|int|null: false|

### Association
- belongs_to :user

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|description|text|null: false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|size_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|condition_id|references|null: false, foreign_key: true|
|ship_fee_burden_id|references|null: false, foreign_key: true|
|ship_method_id|references|null: false, foreign_key: true|
|prefecture_id|references|null: false, foreign_key: true|
|ship_day_id|references|null: false, foreign_key: true|
|price|int|null: false|
|trading_evaluation_id|references|null: false, foreign_key: true|

### Association
- belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
- belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
- belongs_to :category
- belongs_to :size
- belongs_to :brand
- belongs_to :conditon
- belongs_to :ship_fee_burden
- belongs_to :ship_method
- belongs_to :prefecture
- belongs_to :ship_day
- belongs_to :trading_evaluation

- has_many :images
- has_many :comments
- has_many :users, through: :comments
- has_many :likes
- has_many: images

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|hierarchy|references|null: false, foreign_key: true|

### Association
- has_many :products
- has_many :sizes, through: :category_sizes
- has_many :category_sizes
- has_many :hierarchies, class_name: 'Category'
- belongs_to :category, optional: true

## category_sizesテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|

### Association
- belongs_to :category
- belongs_to :size

## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

### Association
- has_many :products
- has_many :categories, through: :category_sizes
- has_many :category_sizes

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand|string|null: false|

### Association
- has_many :products

## conditionsテーブル

|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|

### Association
- has_many :products

## ship_fee_burdensテーブル

|Column|Type|Options|
|------|----|-------|
|method|string|null: false|

### Association
- has_many :products
- be_longs :ship

## ship_methodsテーブル

|Column|Type|Options|
|------|----|-------|
|method|string|null: false|
|ship_fee_burden_id|references|null: false, foreign_key: true|

### Association
- belongs_to :ship_fee_burden
- has_many : products

## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false|

### Association
- has_many :products
- has_many :users

## ship_dayテーブル

|Column|Type|Options|
|------|----|-------|
|day|string|null: false|

### Association
- has_many :products

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|product_id|string|null: false,foreign_key: true|
|user_id|string|null: false,foreign_key: true|

### Association
- belongs_to :product
- belongs_to :user

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|string|null: false,foreign_key: true|
|user_id|string|null: false,foreign_key: true|

### Association
- belongs_to :product
- belongs_to :user

## trading_evaluationテーブル

|Column|Type|Options|
|------|----|-------|
|evaluation|string|null: false|

### Association
- has_many :products

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|product_id|string|null: false,foreign_key: true|

### Association
- belongs_to :product
