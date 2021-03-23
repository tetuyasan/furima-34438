class OrdersController < ApplicationController

  def index
    @buysend = BuySend.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buysend = BuySend.new(buysend_params)
    @item = Item.find(params[:item_id])
    if @buysend.valid?
      @buy_send.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

    def buysend_params
      params.require(:buy_send).permit(:post_number, :address, :city, :area_id, :building, :phone_number).merge(user_id: current_user.id)
    end
  end



