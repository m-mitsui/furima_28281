class ItemsController < ApplicationController
  def index
    @items = Items.includes(params[:id])
  end

  

end
