class ProductsController < ApplicationController

############ CREATE ###########
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
        @product = Product.create(
          name: params[:product][:name],
          category: params[:product][:category],
          ingredients: params[:product][:ingredients],
          notes: params[:product][:notes],
          )

        redirect to "/products/#{@product.id}"
      end

    else params[:product][:name].empty?
      #flash message
      redirect '/products/new'
    end
  end

############ READ ###########
  get '/products' do
    if logged_in?
      @products = Product.all
      erb :'products/index'
    else
      redirect to '/login'
    end
  end

  get '/products/:id' do
    if logged_in?
      @product = Product.find(params[:id])
      erb :'/products/show'
    else
      redirect to '/login'
    end
  end

############ UPDATE ###########

  get '/products/:id/edit' do
    if logged_in?
      @product = Product.find(params[:id])
      erb :'/products/edit'
    else
      redirect to '/login'
    end
  end

  patch '/products/:id' do

    @product = Product.find(params[:id])

    if !params[:product][:name].empty?
      @product.name = params[:product][:name]
      @product.category = params[:product][:category]
      @product.ingredients = params[:product][:ingredients]
      @product.notes = params[:product][:notes]
      @product.save
      redirect to "/products/#{@product.id}"
    else
      redirect to "/products/#{@product.id}/edit"
    end
  end




end
