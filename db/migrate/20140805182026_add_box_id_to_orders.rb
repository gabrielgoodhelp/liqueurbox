class AddBoxIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :box_id, :integer
  end
end
