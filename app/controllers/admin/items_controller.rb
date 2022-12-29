class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all
    
  end

  def new
    @item=Item.new
  end

  def create
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
     @item=Item.find(params[:id])
  end

  def update
    @item=Item.find(params[:id])
  end
  
    private
  def item_params
      params.require(:item).permit(:name, :introduction, :price, :is_active)
  end
end
