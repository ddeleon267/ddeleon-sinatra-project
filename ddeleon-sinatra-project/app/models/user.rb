class User < ActiveRecord::Base
  has_secure_password
  has_many :routines

  def slug
    username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find{|user| user.slug == slug}
  end

  # def self.current_user(session)
  #   self.find(session[:id])
  # end
end
