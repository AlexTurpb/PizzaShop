class CreateOrdersubmits < ActiveRecord::Migration[5.2]
  def change
  	create_table :ordersubmits do |t|
  		t.string :client
  		t.string :phone
  		t.string :adress
  		t.string :ordered_products

  		t.timestamps
  	end
  end
end
