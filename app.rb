#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

def add_client(name)
  client = Client.new(name: name)
  client.save
end

before do
  @barbers = Barber.all
end

get '/' do

	erb :index
end

get '/visit' do
  erb :visit
end

post '/visit' do
  @user_name = params[:user_name]
  @phone = params[:phone]
  @date_time = params[:date_time]
  @barber = params[:barber]
  @color = params[:color]

  c = Client.new
  c.name = @user_name
  c.phone = @phone
  c.datestamp = @date_time
  c.barber = @barber
  c.color = @color
  c.save

  erb "<h2>Спасибо, Вы записались!</h2>"
end


