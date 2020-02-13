class ProductsController < ApplicationController
  def index
  end
  def new
    @product = Product.new
    respond_to do |format|
      format.html
      format.json
    end
  end
end


