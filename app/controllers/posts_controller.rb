class PostsController < ApplicationController
  def index
    @product = Product.find(2)
    @image=Image.find(2)
  end
end