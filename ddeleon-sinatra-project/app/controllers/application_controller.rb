require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    register Sinatra::ActiveRecordExtension
    # set :public_folder, 'public'
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions
    set :session_secret, "password_security"
  end

  use Rack::Flash

  get '/' do
    # binding.pry
    if logged_in?
      redirect to "/users/#{current_user.slug}/main"
    else
      erb :index
    end
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find(session[:id]) if session[:id]
    end
  end

end
