class AddFieldCanUploadToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
      t.integer :can_upload
    end
  end
end
