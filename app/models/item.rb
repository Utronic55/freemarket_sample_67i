class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  has_many :item_images
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User",optional: true
  belongs_to :category
  accepts_nested_attributes_for :item_images
  validates :item_images , presence: true
  validates :category_id , presence: true
  validates :child_category_id , presence: true
  validates :grandchild_category_id , presence: true
  
  validates  :price,  presence: true,length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,
    greater_than: 299, less_than: 10000000
    } 
end
