class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :set_items,only: [:edit,:show,:update]
  before_action :move_to_root_path, only: [:edit]

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def new
   @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

        #def destroy
        #   @items = Item.find(params[:id])
        #   items.destroy
        # end

  def edit
     @items = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
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
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:comment, :image, :item_name, :category_id, :condition_id, :shipping_charge_id, :area_id, :shipping_id, :item_price).merge(user_id: current_user.id)
  end
end

