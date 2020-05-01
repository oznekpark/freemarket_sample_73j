class PurchasesController < ApplicationController

  def show
    @item = Product.find(params[:id])
    @item_img = @item.item_imgs.find(params[:id])
    @sending_destination = @item.sending_destination.find(params[:id])
  end

  def pay
  end

  def complete
    @item_buyer = Item.find(params[:id])
    @item_buyer.update(buyer_id: current_user.id)
  end
  
end
