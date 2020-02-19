class ProductsController < ApplicationController
  before_action :set_item, only: [:show, :purchase, :pay]
  # before_action :set_product 詳細情報の時に使います

  def index 
    # @products = Product.all
    # @images = Image.all
    @products = Product.all.order('created_at DESC').limit(3).to_a
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
      render :new
    end
  end

  # def update 商品詳細の時に使います
  #   if @product.update(product_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end  

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
      :price_id, 
      :buyer_id, 
      :size, 
      :prefecture_id, 
      :shipping_burden, 
      :shipping_date,
      images_attributes: [:src]
    ).merge(user_id: current_user.id)
  end

  # def set_product
  #   @product = Product.find(params[:id]) 詳細情報の時に使います
  # end

  def destroy
    product = Product.find(params[:id])
    product.destroy
  end

end
