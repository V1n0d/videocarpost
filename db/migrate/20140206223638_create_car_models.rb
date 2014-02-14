class CreateCarModels < ActiveRecord::Migration
  def change
    create_table :car_models do |t|
    	t.string :name

    	t.references :vehicle_make
      t.timestamps
    end
  end
end
