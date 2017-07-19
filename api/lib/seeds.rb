
class Seed

	def self.seed
            DataMapper.auto_migrate!
            a = Rgem.create(name: "Nokogiri")
	    b = Library.new(name: "zlib1g-dev",type: "linux")
	    c = Library.new(name: "liblzma-dev",type: "linux")
	    a.libraries<<b
	    a.libraries<<c
	    b.save
	    c.save
	    a = Rgem.create(name: "sinatra")
	    b = Library.new(name: "test_library_1",type: "mac")
	    c = Library.new(name: "test_library_2",type: "linux")
	    d = Library.new(name: "test_library_3",type: "mac")
	    a.libraries<<b
	    a.libraries<<c
	    a.libraries<<d
	    b.save
	    c.save
	    d.save
	    

	end


end



