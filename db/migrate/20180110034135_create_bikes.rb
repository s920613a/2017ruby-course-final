class CreateBikes < ActiveRecord::Migration[5.1]
  def change
    create_table :bikes do |t|
      t.string :bikeType
      t.integer :quantity
      t.references :supplier, foreign_key: true

      t.timestamps
    end
  end
end
