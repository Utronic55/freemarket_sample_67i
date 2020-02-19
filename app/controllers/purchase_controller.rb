class PurchaseController < ApplicationController

  require 'payjp'
  before_action :set_purchase

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "credits", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      @images = ItemImage.find(params[:id])
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @item.price, 
    customer: card.customer_id, 
    currency: 'jpy', 
  )
  redirect_to action:'done'
  end

  def done
    @item.update(buyer_id: current_user.id)
  end

  private

  def set_purchase
    @item = Item.find(params[:id])
  end
end
