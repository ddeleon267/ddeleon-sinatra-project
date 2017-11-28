class ProductsController < ApplicationController

  get '/products/new' do
    if logged_in?
      erb :'products/new'
    else
      redirect to '/login'
    end
  end

end
