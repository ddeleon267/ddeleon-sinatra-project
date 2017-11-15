class UserController < ApplicationController
########### SIGNUP #############

  get '/signup' do
    #if the user is logged in, take them to their hom page. otherwise, direct to signup
    #page ----> need helper method for whether a user is logged in.
    erb :'/users/signup'
  end


end
