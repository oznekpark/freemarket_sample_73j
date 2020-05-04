class CreditCardsController < ApplicationController
  require "payjp"

  def new
    @creditCard = CreditCard.new
    card = CreditCard.where(user_id: current_user.id)
    redirect_to action: :show if card.exists?
  end

  def create #payjpとCardのデータベース作成を実施します
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
    if params['payjpToken'].blank?
      # paramsの中にjsで作った'payjpTokenが存在するか確かめる
      render action: :new
    else
      customer = Payjp::Customer.create(
      card: params['payjpToken'],
      email: current_user.email,
      metadata: {user_id: current_user.id}
      )
      # ↑ここでjay.jpに保存
      @creditcard = Creditcard.new(creditcard_params)
      @creditcard[:customer_id]=customer.id
      @creditcard[:card_id]=customer.default_card
      # @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      # ここでdbに保存
      if @creditcard.save
        flash[:notice] = 'クレジットカードの登録が完了しました'
        redirect_to action: :show
      else
        flash[:alert] = 'クレジットカード登録に失敗しました'
        redirect_to action: :new
      end
    end
  end

   def show #Cardのデータpayjpに送り情報を取り出します
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: :new
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def destroy #PayjpとCardデータベースを削除します
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: :new
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.destroy
      card.destroy
    end
  end

  protected
  def creditcard_params
    params.require(:creditcard).permit(:card_number,:expiration_year, :expiration_month, :cvc)
  end
end