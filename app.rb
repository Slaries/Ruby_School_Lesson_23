require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

configure do
	@db = SQLite3::Database.new 'barbershop.db'
	@db.execute 'CREATE TABLE IF NOT EXISTS 
	"Users" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"username"	TEXT,
	"phone"	TEXT,
	"datestamp"	TEXT,
	"barber"	TEXT,
	"color"	TEXT)'
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	@error = "something wrong!"
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do 
	
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	hh = {  :username => 'Введите имя', 
			:phone => 'Введите телефон',
			:datetime => 'Укажите дату и время'}
	@error = hh.select {|key,_| params[key] == ""}.values.join(", ")

		if @error != ''
			return erb :visit
		end
	

=begin
	hh.each do |key, value|
		if params[key] == ''
			@error = hh[key]

			return erb :visit
		end
	end
	if @username == ''
		@error = 'Введите имя'
		end
	if @phone == ''
		@error = 'Введите номер телефона'
		end
	if @error != ''
		return erb :visit
	end

=end
	erb "OK! username is #{@username} on phone #{@phone} and in day #{@datetime} you barber is #{@baber} and color is #{@color}"
end