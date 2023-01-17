class Admin::OrdersController < ApplicationController
  def show
    @orders=Order.all
    @customer=@order.customer_
  end

  def update
  end
end
