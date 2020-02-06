class AddColumnToItemImage < ActiveRecord::Migration[5.2]
  def change
    add_column :item_images, :name, :string
    add_column :item_images, :item_id, :integer
  end
end
