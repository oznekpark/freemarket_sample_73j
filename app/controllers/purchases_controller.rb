class PurchasesController < ApplicationController

  require "payjp"

  def show
    @item = Item.find(params[:id])
    @item_img = @item.item_imgs.find(params[:id])
    @sending_destination = current_user.sending_destination
    prefecture = Prefecture.data.select{|o| o[:id] == @sending_destination.prefecture_id}.first
    @prefectureName = prefecture[:name]
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
    card = CreditCard.where(user_id: current_user.id).first
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end

  def pay
    item = Item.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
    Payjp::Charge.create(
    :amount => item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  redirect_to action: 'complete' #完了画面に移動
  end

  def complete
    @item_buyer = Item.find(params[:id])
    @item_buyer.update(buyer_id: current_user.id)
  end
end
