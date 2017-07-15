class Library

	include DataMapper::Resource

        property :id, Serial
        property :name, String
	property :type, String
        property :created_at, DateTime
	property :updated_at, DateTime

	validates_presence_of :name
	validates_presence_of :type

	belongs_to :rgem

end

