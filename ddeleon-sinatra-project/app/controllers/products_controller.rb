class ProductsController < ApplicationController

  get '/products/new' do
    if logged_in?
      erb :'products/new'
    else
      redirect to '/login'
    end
  end

  post '/products' do
    if !params[:product][:name].empty?
      if Product.find_by(name: params[:product][:name])
        redirect to '/products/new'
        #flash message -- this product exitss
      else
        product = Product.create(
          name: params[:product][:name],
          category: params[:product][:category],
          ingredients: params[:product][:ingredients],
          notes: params[:product][:notes],
          )
          binding.pry
        redirect '/products'
      end
    else params[:product][:name].empty?
      #flash message
      redirect '/products/new'
    end
  end

  get '/products' do
    @products = Product.all
    erb :'products/index'
  end

end
