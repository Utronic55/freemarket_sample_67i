class TopController < ApplicationController

  def index
    @items = Item.limit(3).order('created_at DESC')
  end
end

