class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
      t.references :customer, foreign_key: true
      t.references :bike, foreign_key: true
      t.integer :price
      t.datetime :backtime

      t.timestamps
    end
  end
end
