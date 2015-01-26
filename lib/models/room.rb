class Room 
  include DataMapper::Resource 

  property :id, Serial
  property :title, String
  property :url, String

  attr_reader :title

end