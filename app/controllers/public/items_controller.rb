class Public::ItemsController < ApplicationController
  def index
    @items=Item.page(params[:page])
    
  end

  def show
    @item=Item.find(params[:id])   
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id, :image)
  end
end
