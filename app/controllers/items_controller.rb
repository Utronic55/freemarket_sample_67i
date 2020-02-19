class ItemsController < ApplicationController
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
    if @item.save!
      flash[:notice] = "出品が完了しました"
      redirect_to root_path
    else
      flash[:alart] = "出品が失敗しました。必須項目を確認してください"
      redirect_to new_path
    end
  end

  def show
    @item = Item.find(params[:id])
    @images = ItemImage.find(params[:id])
  end

  def edit

    @item = Item.find(params[:id])
    gon.item = @item
    gon.item_images = @item.item_images

    # @item.item_images.image_urlをバイナリーデータにしてビューで表示できるようにする、本番環境用の記述
    # require 'base64'
    # require 'aws-sdk'

    # gon.item_images_binary_datas = []
    # if Rails.env.production?
    #   client = Aws::S3::Client.new(
    #                          region: 'ap-northeast-1',
    #                          access_key_id: Rails.application.credentials.aws[:access_key_id],
    #                          secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    #                          )
    #   @item.item_images.each do |image|
    #     binary_data = client.get_object(bucket: 'freemarket-sample-51a', key: image.image_url.file.path).body.read
    #     gon.item_images_binary_datas << Base64.strict_encode64(binary_data)
    #   end
    # else
    #   @item.item_images.each do |image|
    #     binary_data = File.read(image.image_url.file.file)
    #     gon.item_images_binary_datas << Base64.strict_encode64(binary_data)
    #   end
    # end
  end

  def update
    @item = Item.find(params[:id])
    if @item.saler_id == current_user.id
      @item.update(item_params)
      flash[:notice] = "編集が完了しました"
      redirect_to root_path
    else
      flash[:alart] = "編集が失敗しました。必須項目を確認してください"
      redirect_to edit_path
    end
  end


    # 登録済画像のidの配列を生成
    ids = @item.item_images.map{|image| image.id }
    # 登録済画像のうち、編集後もまだ残っている画像のidの配列を生成(文字列から数値に変換)
    exist_ids = registered_image_params[:ids].map(&:to_i)
    # 登録済画像が残っていない場合(配列に０が格納されている)、配列を空にする
    exist_ids.clear if exist_ids[0] == 0

    if (exist_ids.length != 0 || new_image_params[:images][0] != " ") && @item.update(item_params)

      # 登録済画像のうち削除ボタンをおした画像を削除
      unless ids.length == exist_ids.length
        # 削除する画像のidの配列を生成
        delete_ids = ids - exist_ids
        delete_ids.each do |id|
          @item.item_images.find(id).destroy
        end
      end

      # 新規登録画像があればcreate
      unless new_image_params[:images][0] == " "
        new_image_params[:images].each do |image|
          @item.item_images.create(image_url: image, item_id: @item.id)
        end
      end

      flash[:notice] = '編集が完了しました'
      redirect_to item_path(@item), data: {turbolinks: false}

    else
      flash[:alert] = '未入力項目があります'
      redirect_back(fallback_location: root_path)
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
    params.require(:item).permit(:name,:text,:category_id,:child_category_id,:grandchild_category_id,:quality,:delivery_charge,:area_id,:delivery_date,:price,item_images_attributes: [:image]).merge(saler_id: current_user.id)
  end

  # def update_params
  #   params.require(:item).permit(:name,:text,:category_id,:child_category_id,:grandchild_category_id,:quality,:delivery_charge,:area_id,:delivery_date,:saler_id,:price,item_images_attributes: [:image])
  # end

  def registered_image_params
    params.require(:registered_images_ids).permit({ids: []})
  end
