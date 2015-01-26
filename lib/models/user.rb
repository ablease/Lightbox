require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :password_digest, Text
  property :phone, Integer
  property :gmc_number, String
  property :rsa_pu_kay, Text

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
  # validates_presence_of :rsa_pu_keey
  # validates_uniqueness_of :email
  # validates_uniqueness_of :phone

end
