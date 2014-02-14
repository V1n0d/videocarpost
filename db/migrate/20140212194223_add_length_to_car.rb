class AddLengthToCar < ActiveRecord::Migration
  def change
  	change_table :cars do |t|
      t.integer :video_duration
    end
  end
end
