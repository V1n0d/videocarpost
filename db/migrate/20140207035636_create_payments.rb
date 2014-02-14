class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	t.references :user
    	t.string :status
    	t.string :transaction_id
    	t.string :amount
      t.timestamps
    end
  end
end
