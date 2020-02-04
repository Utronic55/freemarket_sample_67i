class Category < ApplicationRecord
  class [Model] < ActiveRecord::Base
    has_many :items
    has_ancestry
 end
end
