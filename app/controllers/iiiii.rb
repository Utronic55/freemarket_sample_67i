require 'payjp'
before_action :move_to_top
before_action :move_to_top, except: :show
before_action :set_item, only: [:before_buy, :pay, :edit, :update, :destroy]

def index
end

def new
  @item = Item.new
  @images = @item.images.build
end

def children_category
  @children = Category.find(params[:parent_id]).children
end

def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to user_path(current_user.id)
  else
    redirect_to new_item_path
  end
end

def edit
  @images = @item.images
end

def update
  if @item.update(item_params_update)
    redirect_to user_path(current_user.id)
  else
    render :edit
  end
end

def show
  @item = Item.includes(:saler).fond(params[:id])
  @images = @item.images
end

def saling_show
  @user = User.find(current_user.id)
  @items = Item.where(buyer_id: current_user.id)
end

def saled_show
  @user = User.find(current_user.id)
  @items = Item.where(buyer_id: current_user.id)
end

def before_buy
  @user = User.find(current_user.id)
  if @user.cards.exits?
    @image = Image.find_by(item_id: @item.id)
    @address = Address.find_by(user_id: current_user.id)
    @card = Card.find_by(user_id: current_user.id)
    customer = Payjp: :Customer.retrieve(@card.customer_id)
    @card_infomation = customer.cards.retrieve(@card.card_id)
  else
    redirect_to new_card_path
  end
end


  private

  def move_to_top
    redirect_to root_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :postage_id, :region_id, :shopping_id)
  end
end