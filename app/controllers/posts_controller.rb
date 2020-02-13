class PostsController < ApplicationController
  def index
    @product = Product.find(3)
  end
end