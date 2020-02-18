class PurchaseController < ApplicationController

  require 'payjp'
  before_action :set_card, only: [:index, :pay]

  def index
    if card.blank?
      redirect_to controller: "credits", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      @item = Item.find(1)
    end
  end

  def pay
    @item = Item.find(1)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @item.price, 
    customer: card.customer_id, 
    currency: 'jpy', 
  )
  redirect_to root_path 
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :text,
      :price,
    ).merge(user_id: current_user.id)
  end

  def set_credit
    card = Card.where(user_id: current_user.id).first
  end

end
