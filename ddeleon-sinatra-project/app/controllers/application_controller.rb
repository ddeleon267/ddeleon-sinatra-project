require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    register Sinatra::ActiveRecordExtension
    set :session_secret, "password_security"
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions
    use Rack::Flash
  end

  get '/' do
    if logged_in?
      redirect to "/home"
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
