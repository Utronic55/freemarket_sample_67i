class ItemsController < ApplicationController

  def new
    @item = Item.new
  end


  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end

end