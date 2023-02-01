class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=current_customer
  end


  def comfirm
    @order=Order.new(order_params)
    @cart_items=CartItem.all
    if params[:number] == "1"
      @order.shipping_address=current_customer.address
      @order.shipping_name=current_customer.first_name + current_customer.last_name
      @order.shipping_postal_code=current_customer.postal_code
    elsif params[:number] == "2"
      @order.shipping_address=@order.addresses.address
      @order.shipping_name=@order.addresses.first_name + @order.addresses.last_name
      @order.shipping_postal_code=@order.addresses.postal_code
    elsif params[:number] == "3"
      @order.shipping_address=params[:order][:shipping_address]
      @order.shipping_name=params[:order][:shipping_name]
      @order.shipping_postal_code=params[:order][:shipping_postal_code]
    end

  end

  def thanks
  end

  def create
    @order=Order.new(order_params)
    @order.customer_id=current_customer.id
    if @order.save!
      current_customer.cart_items.each do |cart_item|
        @order_detail=OrderDetail.new
          @order_detail.item_id=cart_item.item_id
          @order_detail.order_id=@order.id
          @order_detail.purchase_price=cart_item.item.with_tax_price
          @order_detail.amount=cart_item.amount
        @order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to  orders_info_thanks_path
    end
  end

  def index
    @orders=current_customer.orders.all
  end

  def show
    @order=Order.find(params[:id])

  end

  private
    def order_params
      params.require(:order).permit(:shipping_postal_code, :shipping_address, :shipping_name, :total_payment, :payment_method, :postage)
    end
end