class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_items, only: [:index, :create]
  before_action :move_to_root_path, only: [:index, :create]

  def index
    @buyhouse = BuyHouse.new
  end

  def create
    @buyhouse = BuyHouse.new(buyhouse_params)
    if @buyhouse.valid?
      pay_item
      @buyhouse.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def buyhouse_params
    params.require(:buy_house).permit(:post_number, :address, :city, :area_id, :building, :phone_number).merge(item_id: params[:item_id], token: params[:token], user_id: current_user.id)
  end

  def set_items
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
     if current_user.id == @item.user_id || @item.buy != nil
     redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price, 
      card: buyhouse_params[:token],
      currency: 'jpy'
    )
  end
end



