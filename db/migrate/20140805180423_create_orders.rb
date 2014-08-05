class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :province
      t.integer :ZIP_code

      t.timestamps
    end
  end
end
