class ItemsController < ApplicationController

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
    @user = User.find(params[:id])
  end

  def edit
    # 仮置（データが表示されるか確認するため）
    @item = Item.find(1)
  end

  def update
    # 出品者以外は投稿できないようにする
    if @item.user_id == current_user.id
      @item.update(item_params)
      # 編集が終わると出品ページに戻る
      redirect_to root_path,notice: '商品を編集しました'
    else
      # 編集画面に戻る
      redirect_to edit_item_path
    end
  end

  def item_params
    params.require(:item).permit(:name,:text,:category_id,:child_category_id,:grandchild_category_id,:quality,:delivery_charge,:area_id,:delivery_date,:price,item_images_attributes: [:image])#.merge(user_id: current_user.id)
  end

  def item_params_update
    params.require(:item).permit(:name,:text,:category_id,:quality,:delivery_charge,:area,:delivery_date,:price,item_images_attributes: [:image])#.merge(user_id: current_user.id)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path, notice: "投稿内容を削除しました"
end
