class Admin::HomesController < ApplicationController
  def top
    @order_details=OrderDetail.all
    @customer=@order_detail.order_id.customer
  end
end
