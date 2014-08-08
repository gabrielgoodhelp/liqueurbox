class AddPhoneToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :phone_number, :integer
  end
end
