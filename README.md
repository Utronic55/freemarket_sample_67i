# README

## users
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
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|
### Association
- has_many items

## addresses
|Column|Type|Options|
|------|----|-------|
|number|integer|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|town|string|null:false|
### Association
- belongs_to user

## items
|Column|Type|Options|
|------|----|-------|
|id|integer|null:false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
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
-belongs_to category
-belongs_to user

## item_images
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|name|string|null:false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to item

## brands
|Column|Type|Options|
|------|----|-------|
|id|integer|null:false, foreign_key: true|
|name|string|null:false|
### Association
- has_many_items

## categories
|Column|Type|Options|
|------|----|-------|
|id|integer|null:false, foreign_key: true|
|name|string|null:false|
|brand_id|integer|null:false, foreign_key: true|
|path|string|null:false|
### Association
- has_many items
