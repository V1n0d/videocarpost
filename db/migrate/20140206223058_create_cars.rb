class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.attachment :video
      t.integer :miles
      t.integer :price
      t.integer :year
      t.string :dealership_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :contact_number
      t.references :user
      t.references :vehicle_make
      t.references :car_model
      t.references :body_style

    	t.boolean :delta, :default => true # for sphinx
      t.timestamps
    end
  end
end
