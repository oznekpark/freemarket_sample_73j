class ItemsController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def item_show
  end

  def new
    @item = Item.new
    @item.item_imgs.new
  end

  def create
    @item = Item.new(item_params)
    @item.seller_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :brand_id, :size_id, :postage_type_id, :item_condition_id, :postage_payer_id, :prefecture_code, :preparation_day_id, :price, :seller_id, :buyer_id, item_imgs_attributes: [:url])
    
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
