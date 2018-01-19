class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :cusName
      t.string :cusID
      t.string :cusTel

      t.timestamps
    end
  end
end
