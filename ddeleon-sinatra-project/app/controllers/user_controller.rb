class UsersController < ApplicationController
########### SIGNUP #############

get '/signup' do
  # if the user is logged in, take them to their hom page. otherwise, direct to signup
  # page ----> need helper method for whether a user is logged in.
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
  #redirect somewhere.... like page that lists all routines??
  #otherwise...redirect to signup page or do flash message
end
#
#   ############ LOGIN ############
#
  get '/login' do
    #if user not logged in, show login form
    if !logged_in?
      erb :'users/login'
    else
      redirect to "/users/#{current_user.slug}/main"
    #otherwise redirect to their main page, whatever that is
    end
  end
#
  post '/login' do
    #find user
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect to "/users/#{@user.slug}/main"
    else
      redirect to '/signup'
      #will probably need to adapt... ?? what if exist but password bad??
    end
    #if user exists and pasword matches, set session id and redirect to main page
    #otherwise redirect back to signup
  end
#
#   ############ SHOW USER ############
  get '/users/:slug/main' do

    @user = User.find_by_slug(params[:slug])
    #users show page --> only user can see this page --> kind of like your FB home page

    if logged_in?
      @routines = Routine.all
      @products = Product.all
      erb :'/users/main'
      #will need to add something to make sure current user is right
    else
      redirect to '/login'
    end
  end
#
#
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
#
#   ############ LOGOUT ############
#
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
