class ChangeFieldTypeInUsers < ActiveRecord::Migration
  def change
  	change_column :users, :can_upload, :integer, :default => 0
  end
end

