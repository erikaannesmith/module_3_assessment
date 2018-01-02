class Api::V1::ItemsController < ActionController::API

  def index
    render json: Item.all
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: {error: "Not found"}.to_json, status: "204"
  end

  def create
    item = Item.create(item_params)
    if item.save!
      render json: Item.find(params[item.id]), status: 201
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end



end