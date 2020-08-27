class ProductsController < ApplicationController
    before_action :move_to_index, except: [:index]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
     if @product.save
       redirect_to action: :index
     else
       render "new"
     end
  end


   private

   def product_params
     params.require(:product).permit(:name, :category, :price, :explain, :status, :delivery_fee, :delivery_time, :ship_from, :image).merge(consumer_id: current_consumer.id)
   end

   def move_to_index
    unless consumer_signed_in?
       redirect_to new_consumer_session_path  
    end
   end
end
