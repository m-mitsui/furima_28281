class ProductsController < ApplicationController
    before_action :move_to_index, except: [:index]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end
  
  def create
    Product.create(product_params) 
    if Product.create
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end


   private

   def product_params
     params.require(:product).permit(:name, :image, :category, :price, :exhibitor, :status, :delivery_fee, :delivery_time, :ship_from).merge(consumer_id: current_consumer.id)
   end

   def move_to_index
    unless consumer_signed_in?
       redirect_to new_consumer_session_path  #url: :new_consumer_sesssion_path
    end
   end
end
