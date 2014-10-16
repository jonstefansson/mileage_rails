class CreateFillups < ActiveRecord::Migration
  def change
    create_table :fillups do |t|
      t.integer :odometer
      t.date :fill_date, :index
      t.decimal :gallons, precision: 5, scale: 3

      t.timestamps
    end
    add_reference :fillups, :vehicle, index:true
    add_index :fillups, [:odometer, :vehicle_id], unique: true
  end
end
