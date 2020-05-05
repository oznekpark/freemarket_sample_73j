class CreditCardsController < ApplicationController
  require "payjp"

  def new
    @creditCard = CreditCard.new
    # card = CreditCard.where(user_id: current_user.id)
    # redirect_to action: :show if card.exists?
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
    if params['payjpToken'].blank?
      # paramsの中にjsで作った'payjpTokenが存在するか確かめる
      render action: :new
    else
      customer = Payjp::Customer.create(
      card: params['payjpToken'],
      )
      @creditcard = CreditCard.new(
        user_id: current_user.id, 
        customer_id: customer.id, 
        card_id: customer.default_card
        )
      if @creditcard.save
        flash[:notice] = 'クレジットカードの登録が完了しました'
        redirect_to controller: "users", action: 'credit_register'
      else
        flash[:alert] = 'クレジットカード登録に失敗しました'
        redirect_to action: :new
      end
    end
  end

   def show
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: :new
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      default_card_information = customer.cards.retrieve(card.card_id)
      @exp_month = default_card_information.expiration_month.to_s
      @exp_year = default_card_information.expiration_year.to_s.slice(2,3)
      customer_card = customer.cards.retrieve(card.card_id)
      @card_brand = customer_card.brand
      case @card_brand
      when "Visa"
        @card_src = "icon_visa.png"
      when "JCB"
        @card_src = "icon_jcb.png"
      when "MasterCard"
        @card_src = "icon_mastercard.png"
      when "American Express"
        @card_src = "icon_amex.png"
      when "Diners Club"
        @card_src = "icon_diners.png"
      when "Discover"
        @card_src = "icon_discover.png"
      end
    end
  end

  def destroy
    card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete
    card.delete
    redirect_to controller: :users, action: :index
  end
end