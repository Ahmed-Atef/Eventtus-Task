
require 'sinatra'
require 'bundler'

Bundler.require
require 'rgem'
require 'library'
require 'seeds'

#DataMapper.setup(:default, 'sqlite::memory:')

u =  "sqlite://#{Dir.pwd}/project.db"
DataMapper.setup(:default, u)

DataMapper.finalize
DataMapper.auto_upgrade!

get '/rgems' do
     content_type :json
     rgems = Rgem.all
     rgems.to_json    
end

post '/rgems' do
	content_type :json
	rgem = Rgem.new params[:rgem]
	if rgem.save
		status 201
	else
	        status 500
		json rgem.errors.full_messages
	end
end

post '/getDep' do 
	content_type :json
	os =  params[:os]
	gemlist =  params[:gems]
        lib = Array.new
	gemlist.each do |rgem|
		a = Rgem.first(:name => rgem)
                if (a !=nil )
                   a.libraries.each do |l|
			   if(l.type == os)
			   lib<<l.name
			   lib<<"\n"
			   end
		   end
	        end
	end
	#json :names => lib
	lib

end

