#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
	# validates :client, presence: true, length: { in: 4..20 }
	# validates :phone, presence: true, length: { in: 4..20 }
	# validates :client, presence: true, length: { in: 4..20 }
	# validates :phone, presence: true, length: { in: 4..20 }
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

get '/order' do
	erb :order
end

post '/order' do
	erb :order
end
