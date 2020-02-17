class PostsController < ApplicationController
  def index
    # @product = Product.find(3)
    @products = Product.all
    @images = Image.all
  end
end