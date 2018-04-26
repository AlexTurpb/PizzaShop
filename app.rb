#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Ordersubmit < ActiveRecord::Base
	validates :client, presence: true, length: { in: 4..20 }
	validates :phone, presence: true, length: { in: 7..20 }
	validates :adress, presence: true, length: { in: 7..20 }
end

get '/' do
	erb :index			
end

get '/about' do
	erb :about			
end

get '/products' do
	erb :products			
end

get '/item/:id' do
	erb :item			
end

get '/home' do
	erb :home
end

get '/cart' do
	erb :cart
end

post '/cart' do
	order_line = params[:orders]
	@items = parse_orders_line order_line

	if @items.length == 0
		return erb :cart_empty
	end
	
	# @items.each do |item|
	# 	item[0] = Product.find(item[0])
	# end

	erb :cart
end

get '/orders' do
	erb :orders
end

post '/orders' do
	@order_to_db = Ordersubmit.new params[:order]
	if @order_to_db.save
		erb :orders_placed
	else
		@error = @order_to_db.errors.full_messages.first
		erb :orders
	end
end

get '/orders/view' do
	erb :orders_view
end

post '/orders_placed' do
end


def parse_orders_line order_line
	order_line.delete('product_').split(/,|=/).each_slice(2).with_object([]) {|i, a| a << i }
end