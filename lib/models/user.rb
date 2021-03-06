require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :password_digest, String, length: 180
  property :phone, Integer
  property :gmc_number, String
  property :rsakeypub, String, length: 180

  def self.authenticate(email, password)
    user = first(:email => email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  attr_accessor :rsa_pu_keey
  attr_reader :email
  attr_reader :password
  attr_reader :gmc_number
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validates_uniqueness_of :email

end
