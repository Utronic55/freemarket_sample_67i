class TopController < ApplicationController

  def index
    @items = Item.limit(10).order('created_at DESC')
  end
end
