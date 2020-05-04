class UsersController < ApplicationController
  require "payjp"

  # ユーザーマイページ 本来showアクションだと思いますが、showアクションだとidが必要になるため、一旦indexとしています。
  def index
  end

  # クレジットカード登録画面
  def credit_register
    @card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @card_info = customer.cards.retrieve(@card.card_id)
    @exp_month = @card_info.exp_month.to_s
    @exp_year = @card_info.exp_year.to_s.slice(2,3)
    customer_card = customer.cards.retrieve(@card.card_id)
    card_brand = customer_card.brand
    case card_brand
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

  # ログアウト画面
  def logout
  end
end
