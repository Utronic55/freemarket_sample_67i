class Item < ApplicationRecord
  has_many :item_images
  belongs_to user, foreign_key: 'user_id'
  belongs_to :category
end
