class ItemsController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def item_show
  end

  def new
    @category_parent_array = ["---"] #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
    end
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
end
