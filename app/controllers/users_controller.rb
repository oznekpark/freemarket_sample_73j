class UsersController < ApplicationController
  require "payjp"

  # ユーザーマイページ 本来showアクションだと思いますが、showアクションだとidが必要になるため、一旦indexとしています。
  def index
  end

  # クレジットカード登録画面
  def credit_register
    card = CreditCard.where(user_id: current_user.id).first
  end

  # ログアウト画面
  def logout
  end
end
