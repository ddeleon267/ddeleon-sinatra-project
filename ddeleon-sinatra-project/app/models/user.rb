class User < ActiveRecord::Base
  has_secure_password
  has_many :routines
  validates :username, :password, :email, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  def slug
    username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find{|user| user.slug == slug}
  end
end
