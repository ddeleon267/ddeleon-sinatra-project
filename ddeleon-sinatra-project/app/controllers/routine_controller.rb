class RoutineController < ApplicationController

  get '/routines/new' do
    if logged_in?(session)
      erb :'routines/new'
    else
      redirect to '/login'
    end
  end

  post '/routines' do
    # binding.pry
    if params[:name] != ""
      routine = Routine.new(
        name: params[:name],
        products: params[:products].split(",").collect {|name| Product.new(name: name)},
        description: params[:description]
        )
      routine.user_id = session[:id]
      routine.save
      redirect to '/routines'
    end
    redirect to '/routines/new'
  end
end
