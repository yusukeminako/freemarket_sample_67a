class ProductsController < ApplicationController

  def index
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

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
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
      :price_id, 
      :buyer_id, 
      :size, 
      :prefecture_id, 
      :shipping_burden, 
      :shipping_date,
      images_attributes: [:src]
    ).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end