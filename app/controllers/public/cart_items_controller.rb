class Public::CartItemsController < ApplicationController
  def index
    @cart_items=CartItem.all
  end

  def update
    @cart_item=CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to  cart_items_path
    end
  end

  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @new_cart_item=CartItem.new(cart_item_params)
    @cart_item=current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item
      @cart_item.update(amount: params[:cart_item][:amount].to_i + @cart_item.amount)
      redirect_to cart_items_path
    else
      @new_cart_item.customer_id=current_customer.id
      if @new_cart_item.save
      redirect_to  cart_items_path
      end
    end
  end



  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
