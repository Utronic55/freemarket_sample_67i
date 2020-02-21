class ItemsController < ApplicationController

  before_action:set_item, only:[:show,:edit,:update]

  def index
    
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

    if @item.save
      redirect_to root_path
    else
      redirect_to root_path,notice: '出品に失敗しました'
    end

  end

  def show
    @images = ItemImage.find(params[:id])
    @item = Item.find(params[:id])
  end

  def edit
    @item.item_images.build
    @item_images = ItemImage.where(item_id: @item.id)
    @item_image = ItemImage.find(@item.item_image_ids)
    @grandchild = Category.find(@item.grandchild_category_id)
    @child = Category.find(@item.child_category_id)
    @parent = Category.find(@item.category_id)
    #親カテゴリの配列
    @parent_categories = Category.where(ancestry: nil).pluck(:name)
    #子カテゴリの配列
    @child_categories = Category.where('ancestry = ?', "#{@grandchild.parent.ancestry}")
    #孫カテゴリの配列
    @grand_child = Category.where('ancestry = ?', "#{@grandchild.ancestry}")
    respond_to do |format|
      format.html
      format.json
    end
    
  end

  def update
    if @item.update_attributes(update_params)
      redirect_to root_path ,notice: '商品を編集しました'
    else
      redirect_to edit_item_path ,notice: '編集に失敗しました'
    end
     
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path, notice: "投稿内容を削除しました"

  end
end



  private

  def item_params
    params.require(:item).permit(:name,:text,:category_id,:child_category_id,:grandchild_category_id,:quality,:delivery_charge,:area_id,:delivery_date,:price,item_images_attributes: [:image,:_destroy, :id]).merge(saler_id: current_user.id)
  end

  def update_params
    params.require(:item).permit(:name,:text,:category_id,:child_category_id,:grandchild_category_id,:quality,:delivery_charge,:area_id,:delivery_date,:saler_id,:price,item_images_attributes: [:image,:id])
  end

  def set_item
    @item = Item.find(params[:id])
  end