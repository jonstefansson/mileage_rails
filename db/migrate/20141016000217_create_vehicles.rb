class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name, :index

      t.timestamps
    end
  end
end
