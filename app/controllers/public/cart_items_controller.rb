class Public::CartItemsController < ApplicationController
  def index
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item=CartItem.new(cart_item_params[:item_id])
  end
end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
