class ProductsController < ApplicationController
  before_action :set_item, only: [:show, :purchase, :pay]
  def index
  end

  def new
    @product = Product.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    respond_to do |format|
      format.html
      format.json
    end
  end
  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
end

 