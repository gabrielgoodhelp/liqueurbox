class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
