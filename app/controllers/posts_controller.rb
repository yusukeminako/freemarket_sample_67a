class PostsController < ApplicationController
  def index
    # @product = Product.find(3) 後ほど使う可能性あり
    @products = Product.all
    @images = Image.all
  end
end