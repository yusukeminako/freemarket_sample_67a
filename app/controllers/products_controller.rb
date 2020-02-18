class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]

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

  def edit
    @images = Image.where(product_id: @product.id)

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
      images_attributes: [:src, :_destroy, :id]
    ).merge(user_id: "2")
  end

  def set_product
    @product = Product.find(params[:id]) 
  end

end