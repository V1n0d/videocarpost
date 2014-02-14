class CreateBodyStyles < ActiveRecord::Migration
  def change
    create_table :body_styles do |t|
    	t.string :name

      t.timestamps
    end
  end
end
