
require 'net/http'
require 'uri'

#class Libdepend

#	def self.fetch
		gems = Array.new

		puts"Please Specify the location of your Gemfile "
		location = STDIN.gets.chomp
	#Reading the Gemfile line by line to extract used gems names
		begin 

			File.readlines(location).each do |line|
				   words = line.split
				   if words[0] == "gem"
					gems << words[1].split("'")[1]
				   end  

			end
		rescue
			abort("I could not read this file lel asaf")
		end
        #Now setting the OS info for the request
		os = ""
             	if (/darwin/ =~ RUBY_PLATFORM) != nil
			os = "mac"
		
		elsif (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
			os = "windows"
			puts "Kill yourself !!!"
		else
			os = "linux"
		end
	#Sending request using NetHTTP to localserver(for now) 		
		url = URI.parse('http://localhost:4567/getDep')
		http = Net::HTTP.new(url.host, url.port)

		req = Net::HTTP::Post.new(url)

		req.set_form_data('gems[]' => gems,'os' => os)
                
		res = http.request(req)
	

		if res.body.empty? 
			puts "You are good to go (Y) not system dependencies are required"
		else
			puts res.body
		end
#	end
#end

