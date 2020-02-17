class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  has_many :item_images
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User",optional: true
  belongs_to :category
  accepts_nested_attributes_for :item_images
  # validates :item_images , presence: true
end
