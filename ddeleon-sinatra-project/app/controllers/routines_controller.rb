class RoutinesController < ApplicationController

  ############ CREATE ###########
  get '/routines/new' do
    if logged_in?
      erb :'routines/new'
    else
      redirect to '/login'
    end
  end

  post '/routines' do
    # binding.pry
    if params[:name] != "" && params[:products] != []
      routine = Routine.new(
        name: params[:name],
        products: params[:products].split(",").collect {|name| Product.create(name: name)},
        description: params[:description]
        )
      routine.user_id = session[:id]
      routine.save
      redirect to '/routines'
    end
    redirect to '/routines/new'
  end

  ############ READ ###########
  get '/routines' do
  ###this is going to need to be modified
    if logged_in?
      @routines = current_user.routines.all
      erb :'/routines/index'
    else
      redirect to '/login'
    end
  end

  get '/routines/:id' do
    if logged_in?
      @routine = Routine.find(params[:id])
      erb :'/routines/show'
    else
      redirect to '/login'
    end
  end
end
