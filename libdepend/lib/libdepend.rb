
require 'net/http'
require 'uri'


gems = Array.new

#Change this line to the directory of your Gemfile
File.readlines('/Users/Ahmed/Desktop/ELVES/myblog/Gemfile').each do |line|
	   words = line.split
	   if words[0] == "gem"
		gems << words[1].split("'")[1]
	   end  

end


url = URI.parse('http://localhost:3000/')
http = Net::HTTP.new(url.host, url.port)

req = Net::HTTP::Post.new(url)
post_body = []
post_body << gems
req.body = post_body.join

http.request(req)


