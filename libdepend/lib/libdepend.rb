
require 'net/http'
require 'uri'

#class Libdepend

#	def self.getDepend
		gems = Array.new
		#Change this line to the directory of your Gemfile
		File.readlines('/Users/Ahmed/Desktop/Eventtus/api/Gemfile').each do |line|
			   words = line.split
			   if words[0] == "gem"
				gems << words[1].split("'")[1]
			   end  

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

