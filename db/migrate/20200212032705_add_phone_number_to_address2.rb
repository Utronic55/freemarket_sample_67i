class AddPhoneNumberToAddress2 < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :phone_number, :string
  end
end
