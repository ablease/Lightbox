class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :password, Text
  property :gmc_number, Integer

end
