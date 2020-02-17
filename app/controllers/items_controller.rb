class ItemsController < ApplicationController
  def index
    @items = Item.limit(3).order('created_at DESC')
  end
  def new
    @item = Item.new
    @item_images = @item.item_images.build
    
    
  end
    
    # 以下全て、formatはjsonのみ
    # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: params[:parent_name], ancestry: nil).children
  end
  
  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
    end

  end

  def show
    @item = Item.find(params[:id])
    # @user = User.find(params[:id])
  end

  
end

private

# def product_params
#   params.require(:item).permit(:name, :text, :item_image_id, :buyer_id, :seler_id, :category_id, :brand_id, :delivery_method, :size, :delivery_charge, :delivery_date, :price, :quality, :area).merge(user_id: current_user.id)
# end

def item_params
  params.require(:item).permit(:name,:text,:category_id,:child_category_id,:grandchild_category_id,:quality,:delivery_charge,:area_id,:delivery_date,:price,item_images_attributes: [:image]).merge(saler_id: current_user.id)
end

def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path, notice: "投稿内容を削除しました"
end

