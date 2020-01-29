# README

## usersテーブルメルカリユーザー
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|nickname|string|null:false|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|phone_number|integer|null:false|
|email|string|null:false|
|password|string|null:false|
|address_number|integer|null:false|
|address_prefecture|string|null:false|
|address_city|string|null:false|
|address_town|string|null:false|
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|
### Association
- has_many items

## itemsテーブル 出品アイテム
|Column|Type|Options|
|------|----|-------|
|id|integer|null:false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|large_category_id|integer|null: false, foreign_key: true|
|middle_category_id|integer|null: false, foreign_key: true|
|small_category_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
|saler_id|integer|null:false, foreign_key:true|
|name|string|null: false|
|price|integer|null: false|
|text|longtext|null:false|
|size|string|null:false|
|quality|string|null:false|
|delivery_charge|integer|null:false|
|area|string|null:false|
|delivery_method|string|null:false|
|delivery_date|string|null:false|
### Association
-has_many item_images
-belongs_to brand
-belongs_to large_category
-belongs_to middle_category
-belongs_to small_category
-belongs_to user

## item_imagesテーブル
|id|integer|null: false, foreign_key: true|
|name|string|null:false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to item
##brandsテーブル
|id|integer|null:false, foreign_key: true|
|name|string|null:false|
### Association
- has_many_items
##large_categoriesテーブル
|id|integer|null:false, foreign_key: true|
|name|string|null:false|
|brand_id|integer|null:false, foreign_key: true|
|middle_category_id|integer|null:false, foreign_key: true|
|small_category_id|integer|null:false, foreign_key: true|
### Association
- has_many items
- has_many middle_categories
##middle_categoriesテーブル
|id|integer|null: false, foreign_key: true|
|name|string|null:false|
|small_category_id|integer|null: false, foreign_key: true|
### Association
- has_many items
-has_many small_categories
-belongs_to large_category
##small_categoriesテーブル
|id|integer|null:false foreign_key: true|
|name|string|null:false|
### Association
- has_many items
- belongs_to middle_category