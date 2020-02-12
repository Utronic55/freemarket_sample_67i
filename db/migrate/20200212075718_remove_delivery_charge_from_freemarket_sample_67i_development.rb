class RemoveDeliveryChargeFromFreemarketSample67iDevelopment < ActiveRecord::Migration[5.2]
  def change
    remove_column :freemarket_sample_67i_developments, :delivery_charge, :string
  end
end
