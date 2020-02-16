class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item_images = @item.item_images.build
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end 
  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: params[:parent_name], ancestry: nil).children
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
      render :new
    end 
  end


  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end

  def edit
    @item = Item.find(2)
    # paramsに変更する
    # url:/items/:id/edit

    # カテゴリー
    # @category = @product.category
    # @child_categories = Category.where('ancestry = ?', "#{@category.parent.ancestry}")
    # @grand_child = Category.where('ancestry = ?', "#{@category.ancestry}")

    # 画像の上限から登録されている画像の差だけ表示させる
    # image_amount = 10
    # image_amount.freeze
    # num = image_amount - (@item_images.image.length)
    # num.times { @item.images.build }
  end

  def update
    if @item.user_id == current_user.id
       @item.update(item_params)
       redirect_to item_path(@item)
    else
      render :edit
    end
  end

  # def edit

  #   # カテゴリーはよくわからん
  #   @category = @product.category
  #   @child_categories = Category.where('ancestry = ?', "#{@category.parent.ancestry}")
  #   @grand_child = Category.where('ancestry = ?', "#{@category.ancestry}")

  #   # 画像の上限から登録されている画像の差だけ表示させる
  #   image_amount = 5
  #   image_amount.freeze
  #   num = image_amount - (@product.images.length)
  #   num.times { @product.images.build }

  # end

  # def update
  #   if @product.update_attributes(update_params) && params.require(:product).keys[0] == "images_attributes"
  #     redirect_to root_path ,notice: '商品を編集しました'
  #   else
  #     redirect_to edit_product_path
  #   end
  # end






  private

  def item_params
    params.require(:item).permit(:name,:text,:category_id,:quality,:delivery_charge,:area,:delivery_date,:price,item_images_attributes: [:image])#.merge(user_id: current_user.id)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path, notice: "投稿内容を削除しました"
  end


end
