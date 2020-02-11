class ItemsController < ApplicationController

  def new
    @item = Item.new
    # @item_images = Item_image.new
  end
  def show
    @item = Item.find(params[:id])
  end
end
