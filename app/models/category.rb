class Category < ApplicationRecord
  has_many :items
  has_ancestry

  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :quality, presence: true
  validates :delievery_charge, presence: true
  validates :delivery_date, presence: true
  validates :areae, presence: true
  validates :price, presence: true
end