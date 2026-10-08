class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :current_user, only: [:edit, :update]
  def index
    @items = Item.order(created_at: :desc)
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

  def show
  end
  
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end
 private

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_user
    redirect_to root_path unless @item.user == current_user
  end

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
end