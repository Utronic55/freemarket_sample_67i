class CreateItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_images do |t|
      t.name :string ,null: false
      t.item_id :integer ,null: false
      t.timestamps
    end
  end
end
