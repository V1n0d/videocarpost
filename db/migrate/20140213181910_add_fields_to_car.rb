class AddFieldsToCar < ActiveRecord::Migration
  def change
  	change_table :cars do |t|
      t.string :vin
    end
  end
end
