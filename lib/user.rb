require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :password_digest, Text
  property :gmc_number, Integer

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
