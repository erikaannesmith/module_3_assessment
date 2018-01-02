class Api::V1::ItemsController < ActionController::API

  def index
    render json: Item.all
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end


end