class ItemsController < ApplicationController

  def new
    @item = Item.new
  end


  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path, notice: "投稿内容を削除しました"
  end


end