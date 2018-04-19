#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Ordersubmit < ActiveRecord::Base
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
	@order = params[:orders].split(/,|=/).each_slice(2).with_object({}) { |(k,v),h| h[k] = v.to_i }
	erb :cart
end

get '/orders' do
	erb :orders
end

post '/orders' do
	@order_to_db = Ordersubmit.new params[:order]
	@order_to_db.save
	erb :orders
end
