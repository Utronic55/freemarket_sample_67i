class CreditsController < ApplicationController
  
  def new
  end

  def create
    console.log
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: User(1).id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to root_path
      else
        redirect_to action: "edit", id: current_user.id
      end
    end
  end

  def confirmation
    # card = current_user.credit_cards
    # redirect_to action: "show" if card.exists?
  end


  

  private
  def get_payjp_info
    if Rails.env == 'development'
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    end
  end
end