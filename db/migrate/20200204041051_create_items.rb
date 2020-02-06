class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer     :brand_id, null: false, foreign_key: true
      t.integer     :category_id, null: false, foreign_key:true
      t.integer     :buyer_id, null: false, foreign_key:true
      t.integer     :saler_id, null:false, foreign_key:true
      t.string      :name, null: false
      t.integer     :price, null: false
      t.longtext    :text, null: false
      t.string      :size, null: false
      t.string      :quality, null: false
      t.integer     :deliverey_charge, null: false
      t.string      :area, null: false
      t.string      :delivery_method, null: false
      t.string      :delivery_date, null: false
      t.timestamps
    end
  end
end
