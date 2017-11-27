class UsersController < ApplicationController

############ LOGIN ############

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to "/home"
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    #if user exists and pasword matches
    if @user && @user.authenticate(params[:password])
      # flash[:message] = ""
      session[:id] = @user.id
      redirect to "/home"
    # elsif @user && !@user.authenticate(params[:password])
    #   flash[:message] = "Invalid Password - Please try again."
    #   redirect to '/login'
    else
      # flash[:message] = "No such user was found - Please try again."
      # erb :'/users/login'
      redirect to '/signup'
    end
  end

########### SIGNUP #############

get '/signup' do
  if !logged_in?
    erb :'/users/signup'
  else
    redirect to "/home"
  end
end

post '/signup' do
  #would like to be able to do this with just params
  if User.find_by(username: params[:username])
    # flash[:message] = "That username is taken, please try another one!"
    redirect '/signup'
  else
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      session[:id] = @user.id

      redirect to "/home"
    else
      #flash[:message] = "Invalid Signup Details - Password must be 6+ characters in length, Email must be in standard format."
      redirect to '/signup'
    end
  end
end

############ SHOW USER ############
  get '/home' do
    @user = current_user

    if logged_in?
      @routines = Routine.all
      @products = Product.all

      erb :'/users/home'
    else
      redirect to '/login'
    end
  end

  get '/users/:slug' do
    #user show page ---> for other users and owner to see ---> kind of like FB timeline
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      @user_routines = @user.routines
      erb :'/users/show'
    else
      redirect to '/login'
    end
  end

############ LOGOUT ############

  get '/logout' do
    #if logged in, clear session, redirect to login
    #otherwise, redirect to main index page. could change these redirects as well
    session.clear
    redirect to '/'
  end
end
