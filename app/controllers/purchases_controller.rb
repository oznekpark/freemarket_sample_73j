class PurchasesController < ApplicationController
  before_action :set_item
  before_action :set_card
  before_action :set_payjpSecretKey

  require "payjp"

  def show
    redirect_to item_path(@item.id) if @item.buyer_id.present?
    @item_img = @item.item_imgs[0]
    @sending_destination = current_user.sending_destination
    prefecture = Prefecture.data.select{|o| o[:id] == @sending_destination.prefecture_id}.first
    @prefectureName = prefecture[:name]
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3)
    end
  end

  def pay
    purchase = Payjp::Charge.create(
    amount: @item.price,
    customer: @card.customer_id,
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

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_card
    @card = CreditCard.where(user_id: current_user.id).first
  end

  def set_payjpSecretKey
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
  end
end
