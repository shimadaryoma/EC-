class Admin::OrderDetailsController < ApplicationController
  def update
    @order=Order.find(params[:id])
    if @order.update(order_params)
      redirect_to order_path(@order.id) 
    end
  end 
  
   private
    def order_params
      params.require(:order).permit(:shipping_postal_code, :shipping_address, :shipping_name, :total_payment, :payment_method, :postage)
    end
end
