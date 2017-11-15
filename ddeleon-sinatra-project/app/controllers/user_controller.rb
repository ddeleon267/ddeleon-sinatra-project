class UserController < ApplicationController
########### SIGNUP #############

  get '/signup' do
    # if the user is logged in, take them to their hom page. otherwise, direct to signup
    # page ----> need helper method for whether a user is logged in.
    if !logged_in?(session)
      erb :'/users/signup'
    else
      redirect to '/users/main'
    end
  end

  post '/signup' do
    #would like to be able to do this with just params
    user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if params[:username] != "" && params[:email] != "" && params[:password] != ""
      user.save
      session[:id] = user.id
      # binding.pry
      redirect to '/users/main'
    # binding.pry
    else
      redirect to '/signup'
    end
    #redirect somewhere.... like page that lists all routines??
    #otherwise...redirect to signup page or do flash message
  end

  ############ LOGIN ############

  get '/login' do
    #if user not logged in, show login form
    if !logged_in?(session)
      erb :'users/login'
    else
      redirect to '/users/main'
    #otherwise redirect to their main page, whatever that is
    end
  end

  post '/login' do
    #find user
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect to 'users/main'
    else
      redirect to '/signup'
      #will probably need to adapt... ?? what if exist but password bad??
    end
    #if user exists and pasword matches, set session id and redirect to main page
    #otherwise redirect back to signup
  end

  ############ SHOW USER ############
  #not sure what to do with this routines
  get '/users/main' do
    if logged_in?(session)
      binding.pry
      erb :'/users/main'
      #will need to add something to make sure current user is right
    else
      redirect to '/login'
    end
  end


  get '/users/:slug' do
    #find user by slug
    erb :'/users/show'
  end

  ############ LOGOUT ############

  get '/logout' do
    #if logged in, clear session, redirect to login
    #otherwise, redirect to main index page. could change these redirects as well
    if logged_in?(session)
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
