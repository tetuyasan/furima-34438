class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :set_items,only: [:edit,:show,:update,:destroy]
  before_action :move_to_root_path, only: [:edit, :destroy,:update]

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def new
   @item = Item.new
  end

  def show
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to action: :index
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_items
    @item = Item.find(params[:id])
  end

  def move_to_root_path
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:comment, :image, :item_name, :category_id, :condition_id, :shipping_charge_id, :area_id, :shipping_id, :item_price).merge(user_id: current_user.id)
  end
end

