class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.datetime :purchased_date
    	t.string :stripe_id
      t.timestamps
    end
  end
end
