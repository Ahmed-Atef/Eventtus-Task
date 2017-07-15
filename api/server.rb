
require 'sinatra'
require 'bundler'

Bundler.require
require 'rgem'
require 'library'

DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.finalize
DataMapper.auto_migrate!

get '/rgems' do

     content_type :json
     rgems = Rgem.all
     rgems.to_json    
end


post '/getDep' do 
	content_type :json
	puts params[:gems]
     
end


