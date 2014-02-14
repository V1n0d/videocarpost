class AddMetaFieldToCars < ActiveRecord::Migration
  def change
  	change_table :cars do |t|
      t.text :video_meta
    end
  end
end
