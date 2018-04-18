class CreateOrders < ActiveRecord::Migration[5.2]
  def change
  	create_table :orders do |t|
  		t.string :client
  		t.string :phone
  		t.string :adress
  		t.string :ordered_products

  		t.timestamps
  	end
  end
end
