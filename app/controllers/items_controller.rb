class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).order('created_at DESC').limit(9)
  end
  def new
    @item = Item.new
  end
  def show
    @item = Item.find(params[:id])
  end

  private

  def product_params
    params.require(:item).permit(:name, :text, :item_image_id, :buyer_id, :seler_id, :category_id, :brand_id, :delivery_method, :size, :delivery_charge, :delivery_date, :price, :quality, :area).merge(user_id: current_user.id)
  end
end

