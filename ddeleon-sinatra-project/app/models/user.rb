class User < ActiveRecord::Base
  has_secure_password

  has_many :routines
  has_many :products, through: :routines
end
