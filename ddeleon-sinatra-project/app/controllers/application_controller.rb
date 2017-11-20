require './config/environment'
class ApplicationController < Sinatra::Base

  configure do
    register Sinatra::ActiveRecordExtension
    # set :public_folder, 'public'
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions
    set :session_secret, "password_security"
  end

  helpers do
    def logged_in?(session)
      !!session[:id]
    end
  end

  get '/' do
    # binding.pry
    "Hello, World!!!"
  end

end
