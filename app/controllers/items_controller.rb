class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.item_imgs.build
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end
    
  private
  def item_params
    params.require(:item).permit(
      :name, 
      :price,
      :introduction,
      :
      [item_imgs_attributes: [:image]]
    )
	end
end
