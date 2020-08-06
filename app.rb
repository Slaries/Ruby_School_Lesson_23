require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
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

	erb "OK! username is #{@username} on phone #{@phone} and in day #{@datetime} you barber is #{@baber} and color is #{@color}"
end