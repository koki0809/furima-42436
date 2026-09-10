class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)

    if @item.save 
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end 
end

private

def item_params
  params.require(:item).permit(
    :name,
    :image,
    :description,
    :category_id,
    :condition_id,
    :shipping_duration_id,
    :shipping_fee_burden_id,
    :shipping_origin_id,
    :price
  )
end