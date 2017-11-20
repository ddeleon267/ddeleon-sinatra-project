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
    if logged_in?
      redirect to "/users/#{current_user.slug}/main"
    else
      erb :index
    end
  end

end
