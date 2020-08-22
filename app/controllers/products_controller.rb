class ProductsController < ApplicationController
  #  before_action :move_to_index, except: [:index]

  def index
    @products = Product.all
  end

  def new

  end
  
  def create
    Product.create(product_params)
  end

    # def move_to_index
    #   unless consumer_signed_in?
    #     redirect_to action: :index
    # end
  
end
