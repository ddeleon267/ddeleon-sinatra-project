class UsersController < ApplicationController
########### SIGNUP #############

get '/signup' do
  if !logged_in?
    erb :'/users/signup'
  else
    redirect to "/users/#{current_user.slug}/main"
  end
end

post '/signup' do
  #would like to be able to do this with just params
  @user = User.new(username: params[:username], email: params[:email], password: params[:password])
  if @user.save
    session[:id] = @user.id

    redirect to "/users/#{@user.slug}/main"
  else
    redirect to '/signup'
  end
end

############ LOGIN ############

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to "/users/#{current_user.slug}/main"
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    #if user exists and pasword matches
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect to "/users/#{@user.slug}/main"
    else
      redirect to '/signup'
    end
  end

############ SHOW USER ############
  get '/users/:slug/main' do ########

    @user = User.find_by_slug(params[:slug])
    #users main page --> only user can see this page --> kind of like your FB home page

    if logged_in? && current_user.id == @user.id
      @routines = Routine.all
      @products = Product.all
      erb :'/users/main'
    elsif  logged_in? && current_user.id != @user.id
      redirect to "/users/#{current_user.slug}/main"
      #will need to add something to make sure current user is right
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
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
