class AddProducts < ActiveRecord::Migration[5.1]
  def change
  	Product.create :title => 'Hawaiian', :description => 'This is Hawaiian pizza',	:price => 350, :size => 30,	:is_spicy => false,	:is_veg => false, :is_best_offer => false, :image => '/images/hawaiian.jpg'

  	Product.create :title => 'Pepperoni', :description => 'Nice Pepperoni pizza', :price => 450, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => true, :image => '/images/pepperoni.png'

  	Product.create :title => 'Vegetarian', :description => 'Amazing Vegetarian pizza', :price => 400, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => false, :image => '/images/veggie.jpg'

  	Product.create :title => 'Balado', :description => 'An Indonesian fusion cuisine', :price => 425, :size => 30, :is_spicy => true, :is_veg => false, :is_best_offer => false, :image => '/images/balado.jpg'

  	Product.create :title => 'Margherita', :description => 'Authentic Neapolitan pizza', :price => 375, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => false, :image => '/images/margherita.jpg'

  	Product.create :title => 'Quattro', :description => 'Pizza quattro stagioni', :price => 450, :size => 30, :is_spicy => true, :is_veg => false, :is_best_offer => true, :image => '/images/quattro_stagioni.jpg'
  end
end
