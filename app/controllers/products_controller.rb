class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]
  before_action :move_to_index, except: [:index, :show]
  def index 
    @products = Product.where(buyer_id: nil).order('created_at DESC').to_a
    @images = Image.all

  end

  def new
    @product = Product.new
    @product.images.new
    @images = @product.images.build
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  def show
    @product = Product.find(params[:id])
  end  

  def edit
    @images = Image.where(product_id: @product.id)
    @product.images.build
    # @images = @product.images.build
    @grandchild = Category.find(@product.category_id)
    @child = @grandchild.parent
    @parent = @grandchild.parent.parent

    @category_grandchild_array = ["---"]
    Category.where(ancestry: @grandchild.ancestry).each do |grandchild|
      @category_grandchild_array << grandchild.name
    end

    @category_child_array = ["---"]
    Category.where(ancestry: @child.ancestry).each do |child|
      @category_child_array << child.name
    end

    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    @category = Category.find(@product.category_id)
    @child_categories = Category.where('ancestry = ?', "#{@category.parent.ancestry}")
    @grand_child = Category.where('ancestry = ?', "#{@category.ancestry}")
  end

  def update 
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end  
  
  def show
    @product = Product.find(params[:id])
    @category = Category.find(@product.category_id)
    @user = User.find_by(id: @product.user_id)
  end

  def confirm
    @product = Product.find(params[:id])
    @category = Category.find(@product.category_id)
    @user = User.find_by(id: @product.user_id)
  end

  def delete #削除完了後
  end


  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to delete_products_path
    else
      redirect_to products_path
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  private

  def product_params
      params.require(:product).permit(
      :user_id, 
      :name, 
      :condition, 
      :description, 
      :category_id, 
      :brand_id, 
      :price, 
      :buyer_id, 
      :size, 
      :prefecture_id, 
      :shipping_burden, 
      :shipping_date,
      images_attributes: [:src, :_destroy, :id]
    ).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id]) 
  end


  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
