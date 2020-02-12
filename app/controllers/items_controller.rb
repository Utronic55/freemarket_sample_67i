class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item_images = @item.item_images.build
    @category_parent_array = Category.where(ancestry: nil)
    # itemに紐づいていいる孫カテゴリーの親である子カテゴリが属している子カテゴリーの一覧を配列で取得
    # @category_child_array = @item.category.parent.parent.children
    # # itemに紐づいていいる孫カテゴリーが属している孫カテゴリーの一覧を配列で取得
    # @category_grandchild_array = @item.category.parent.children
    
  end
  
  def create
    binding.pry
    @item = Item.new(item_params)
    @item.save!
    redirect_to root_path

  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name,:text,:category_id,:quality,:delivery_charge,:area,:delivery_date,:price,item_images_attributes: [:image])#.merge(user_id: current_user.id)
  end

end
