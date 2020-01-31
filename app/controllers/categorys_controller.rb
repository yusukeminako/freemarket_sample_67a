class CategorysController < ApplicationController
  def index
    @parents = Category.all.order("id DESC”).limit(13)
  end
end

