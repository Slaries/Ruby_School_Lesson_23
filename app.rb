require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

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
	@baber = params[:baber]
	@color = params[:color]

	hh = {  :username => 'Введите имя', 
			:phone => 'Введите телефон',
			:datetime => 'Укажите дату и время'}
	hh.each do |key, value|
		if params[key] == ''
			@error = hh[key]

			return erb :visit
		end
	end
=begin
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