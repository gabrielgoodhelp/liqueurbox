class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :producer, :string
    add_column :products, :producer_address, :string
  end
end
