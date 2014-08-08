class ChangePhoneNumberTypeInOrders < ActiveRecord::Migration
  def self.up
    change_column :orders, :phone_number, :integer
  end

  def self.down
    change_column :orders, :phone_number, :string
  end
end