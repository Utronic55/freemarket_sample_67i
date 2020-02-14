class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item_images = @item.item_images.build
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
    
  end
  
  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to root_path

  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name,:text,:category_id,:quality,:delivery_charge,:area,:delivery_date,:price,item_images_attributes: [:image])#.merge(user_id: current_user.id)
  end

end
