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
    
    if !params[:routine][:name].empty? && !params[:routine][:description].empty?
      @routine = Routine.new(params[:routine])
      # @routine = Routine.new(
      #   name: params[:routine][:name],
      #   products: params[:routine][:products].split(",").collect {|name| Product.create(name: name)},
      #   description: params[:routine][:description]
      #   )

      @routine.user_id = session[:id]
      @routine.save

      erb :'routines/show'
    else
      redirect '/routines/new'
    end
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

  ############ UPDATE ###########
  get '/routines/:id/edit' do
    if logged_in?
      @routine = Routine.find(params[:id])
      erb :'/routines/edit'
    else
      redirect to '/login'
    end
  end

  patch '/routines/:id' do
    ##need to fix this

	  @routine = Routine.find(params[:id])

    last_name = @routine.name
    # last_products = @routine.products
    last_description = @routine.description

      if current_user.id == @routine.user_id
	      @routine.update(name: params[:routine][:name])
        # @routine.update(products: params[:routine][:products])
        @routine.update(description: params[:routine][:description])

        @routine.update(name: last_name) if params[:routine][:name].empty?
        # @routine.update(products: last_products) if params[:routine][:products].empty?
        @routine.update(description: last_description) if params[:routine][:description].empty?

        if @routine.save
          redirect to "/routines/#{@routine.id}"
        else
          redirect to "/routines/#{@routine.id}/edit"
        end
      else
        redirect to "/routines"
      end
	end

  ############ DELETE #############

  delete '/routines/:id/delete' do
    @routine = Routine.find(params[:id])
    if logged_in? && @routine.user == current_user
      @routine.delete
      # flash[:message] = "This routine has been deleted"
      redirect to '/home'
    else
      redirect to '/login'
    end

  end
end
