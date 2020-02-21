class ItemImagesController < ApplicationController
  def destroy
    item_image = ItemImage.find(params[:id])
    if item_image.item.saler_id == current_user.id
      if item_image.item.item_images.length ==1
        redirect_to root_path , notice:'写真は一枚以上登録してください。'
        # 最後の一枚は削除できません
      else
        item_image.destroy
        # redirect_to :back
      end
    else
      
    end
  end
  # def item_image_params
  #   params.require(:item_image).permit(:id)
  # end
end
