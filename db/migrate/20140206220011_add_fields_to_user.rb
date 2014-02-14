class AddFieldsToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_number
      t.attachment :profile_pic
      t.boolean :is_admin, :default => false
    end
  end
end
