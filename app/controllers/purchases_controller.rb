class PurchasesController < ApplicationController

  require "payjp"

  def show
    @item = Item.find(params[:id])
    if @item.buyer_id.present?
      redirect_to root_path
    else
      @item_img = @item.item_imgs.find(params[:id])
      @sending_destination = current_user.sending_destination
      prefecture = Prefecture.data.select{|o| o[:id] == @sending_destination.prefecture_id}.first
      @prefectureName = prefecture[:name]
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
      @card = CreditCard.where(user_id: current_user.id).first
      if @card.present?
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @card_info = customer.cards.retrieve(@card.card_id)
        @exp_month = @card_info.exp_month.to_s
        @exp_year = @card_info.exp_year.to_s.slice(2,3)
      end
    end
  end

  def pay
    item = Item.find(params[:item_id])
    card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
    purchase = Payjp::Charge.create(
    amount: item.price,
    customer: card.customer_id,
    currency: 'jpy',
    card: params['payjpToken']
    )
    if purchase.save
      @item_buyer = Item.find(params[:item_id])
      @item_buyer.update(buyer_id: current_user.id)
      flash[:notice] = '購入が完了しました'
      redirect_to root_path
    else
      flash[:notice] = '購入に失敗しました'
      redirect_to :show
    end
  end
end
