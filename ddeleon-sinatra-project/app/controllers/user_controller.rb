class UserController < ApplicationController
########### SIGNUP #############

  get '/signup' do
    # if the user is logged in, take them to their hom page. otherwise, direct to signup
    # page ----> need helper method for whether a user is logged in.
    if !logged_in?(session)
      erb :'/users/signup'
    else
      erb :'/users/main'
    end
  end

  post '/signup' do
    user = User.new(:username => params[:username], :password => params[:password])
    if params[:username] != "" && params[:email] != "" && params[:password] != ""
      user.save
      session[:id] = user.id
      # binding.pry
      erb :'/users/main'
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
    erb :'users/login'
    #otherwise redirect to their main page, whatever that is
  end

  post '/login' do
    #find user
    #if user exists and pasword matches, set session id and redirect to main page
    #otherwise redirect back to signup
  end

  ############ SHOW USER ############

  # get '/users/:slug' do
  #   #find user by slug
  #   erb :'/users/show'
  # end

  ############ LOGOUT ############

  get '/logout' do
    #if logged in, clear session, redirect to login
    #otherwise, redirect to main index page. could change these redirects as well
  end
end
