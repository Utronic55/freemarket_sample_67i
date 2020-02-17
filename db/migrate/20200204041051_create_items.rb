class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer    :category_id, foreign_key:true
      t.integer     :child_category_id, foreign_key:true
      t.integer     :grandchild_category_id, foreign_key:true
      t.integer     :buyer_id, null: false, foreign_key:true
      t.integer     :saler_id, null:false, foreign_key:true
      t.string      :name, null: false
      t.integer     :price, null: false
      t.longtext    :text, null: false
      t.string      :quality, null: false
      t.string      :delivery_charge, null: false
      t.integer      :area_id, null: false
      t.string      :delivery_date, null: false
      t.timestamps
    end
  end
end
