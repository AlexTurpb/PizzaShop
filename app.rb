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
	@order = parse_orders_line order_line
	erb :cart
end

get '/orders' do
	erb :orders
end

post '/orders' do
	@order_to_db = Ordersubmit.new params[:order]
	if @order_to_db.save
		@info = 'Purchase done'
		erb :orders
	else
		@error = @order_to_db.errors.full_messages.first
		erb :orders
	end
end

def parse_orders_line order_line
	order_line.delete('product_').split(/,|=/).each_slice(2).with_object({}) { |(k,v),h| h[k] = v.to_i }
end