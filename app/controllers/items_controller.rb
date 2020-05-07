class ItemsController < ApplicationController
  before_action :set_item, only:[:show,:destroy, :edit, :update]

  def index
    @parents = Category.where(ancestry: nil)
    @items = Item.includes(:item_imgs).order("created_at DESC")
  end

  def new
    @item = Item.new
    @item.item_imgs.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end

  def create
    @item = Item.new(item_params)
    @item.seller_id = current_user.id
    if @item.save
      flash[:notice] = '出品が完了しました'
      redirect_to root_path
    else
      redirect_to new_item_path(@item), flash: { error: @item.errors.full_messages }
    end
  end

  def show
    
  end

  def destroy
    if @item.seller_id == current_user.id && @item.destroy
      redirect_to root_path
      flash[:notice] = '商品の削除が完了しました'
    else
      render "items/show"
    end
  end

  def edit
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end
    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end

  def update
    if @item.update(item_update_params)
      flash[:notice] = '商品の編集が完了しました'
      redirect_to item_path(@item)
    else
      grandchild_category = @item.category
      child_category = grandchild_category.parent
      @category_parent_array = []
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
      @category_children_array = []
      Category.where(ancestry: child_category.ancestry).each do |children|
        @category_children_array << children
      end
      @category_grandchildren_array = []
      Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
        @category_grandchildren_array << grandchildren
      end
      render :edit
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

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :brand_id, :size_id, :postage_type_id, :item_condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price, :seller_id, :buyer_id, item_imgs_attributes: [:url])
  end
  
  def item_update_params
    params.require(:item).permit(:updated_at, :name, :introduction, :category_id, :brand_id, :size_id, :postage_type_id, :item_condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price, :seller_id, :buyer_id, [item_imgs_attributes: [:url, :_destroy, :id]])
  end
  

  def set_item
    @item = Item.find(params[:id])
  end
  
end
