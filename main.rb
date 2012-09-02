require 'rubygems'
require 'sinatra'
require 'erb'

#1.9.2 hacks?
set :run, true
set :views, File.dirname(__FILE__) + "/views"
set :public, File.dirname(__FILE__) + "/public"

get '/' do
  erb :index
end

get '/pdf/:url' do
  filename = Time.now.to_i.to_s
  `wkhtmltopdf #{params[:url]} public/pdfs/#{filename}.pdf`  
  filename
end

