class ChangePhoneNumberTypeInOrders < ActiveRecord::Migration
  def up
    change_column :orders, :phone_number, :integer
  end

  def down
    change_column :orders, :phone_number, :string
  end
end